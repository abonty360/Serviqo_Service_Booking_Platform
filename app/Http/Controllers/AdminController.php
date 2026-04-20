<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\ServiceProvider;
use App\Models\Category;
use App\Models\SubService;
use App\Models\ServiceProviderOffering;
use App\Models\ServiceArea;
use App\Models\ServiceOrder;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function dashboard()
    {
        return response()->json(auth('api')->user());
    }

    public function providers()
    {
        $providers = ServiceProvider::where('full_name', '!=', 'System Provider')
            ->with(['serviceArea', 'ratings'])
            ->get();
        
        // Add offered_sub_services to each provider
        $providers = $providers->map(function($provider) {
            $offerings = ServiceProviderOffering::where('service_provider_id', $provider->id)
                ->pluck('sub_service_id')
                ->toArray();
            $provider->offered_sub_services = $offerings;
            return $provider;
        });
        
        \Log::info('Providers API Response:', [
            'total_providers' => $providers->count(),
            'sample_provider' => $providers->first() ? [
                'id' => $providers->first()->id,
                'name' => $providers->first()->full_name,
                'city' => $providers->first()->city,
                'offered_sub_services' => $providers->first()->offered_sub_services
            ] : null
        ]);
        
        return response()->json($providers);
    }

    public function service_areas()
    {
        $areas = ServiceArea::all();
        return response()->json($areas);
    }

    public function sub_services()
    {
        $services = SubService::with('category')->get();
        return response()->json($services);
    }

    public function store_provider(Request $request)
    {
        $validated = $request->validate([
            'full_name' => 'required|string|max:255',
            'email' => 'required|email|unique:service_providers,email',
            'phone' => 'required|string|max:20',
            'address' => 'nullable|string|max:255',
            'city' => 'required|string|max:100',
            'nid' => 'required|string|unique:service_providers,nid',
            'service_area_id' => 'required|exists:service_areas,id',
            'rating' => 'nullable|numeric|min:0|max:5',
            'offerings' => 'nullable|array',
            'offerings.*.service_name' => 'required|string',
            'offerings.*.category_name' => 'required|string'
        ]);

        DB::beginTransaction();
        try {
            $providerData = collect($validated)->except('offerings')->toArray();
            
            // Handle 'region' column which exists in DB and is in fillable
            $providerData['region'] = $providerData['city'];
            $providerData['rating'] = $providerData['rating'] ?? 0.0;
            $providerData['address'] = $providerData['address'] ?? '';

            $provider = ServiceProvider::create($providerData);

            if (!empty($validated['offerings'])) {
                foreach ($validated['offerings'] as $offering) {
                    $category = Category::firstOrCreate(
                        ['name' => $offering['category_name']],
                        ['description' => '']
                    );
                    $subService = SubService::firstOrCreate(
                        [
                            'service_name' => $offering['service_name'],
                            'category_id' => $category->id
                        ],
                        ['description' => '']
                    );

                    ServiceProviderOffering::create([
                        'service_provider_id' => $provider->id,
                        'sub_service_id' => $subService->id,
                        'price_charged' => 0.00,
                        'rating' => 0
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                'message' => 'Service provider and offerings created successfully',
                'provider' => $provider->load('serviceArea')
            ], 201);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Failed to create provider',
                'error' => $exceptionMessage = $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ], 500);
        }
    }

    public function all_bookings()
    {
        $bookings = ServiceOrder::with(['customer', 'items.offering.subService', 'items.offering.provider', 'payments'])->orderBy('created_at', 'desc')->get();

        return response()->json($bookings);
    }

    public function update_status(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|string'
        ]);

        \Illuminate\Support\Facades\Log::info('Updating status for order ' . $id . '. New status: ' . $request->status);

        $order = ServiceOrder::find($id);
        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $oldStatus = trim(strtolower($order->status));
        $newStatus = trim(strtolower($request->status));
        
        $order->status = $request->status;
        $order->save();

        \Illuminate\Support\Facades\Log::info("Status Change Check: Old=[$oldStatus], New=[$newStatus]");

        if (($newStatus === 'confirmed' || $newStatus === 'approved' || $newStatus === 'order confirmed') && $oldStatus !== $newStatus) {
            // Create order confirmation
            $confirmation = new \App\Models\OrderConfirmation();
            $confirmation->service_order_id = $order->id;
            $confirmation->confirmation_status = 'confirmed';
            $confirmation->final_amount = $order->total_amount;
            $confirmation->confirmed_at = now();
            $confirmation->save();

            \Illuminate\Support\Facades\Log::info('Creating notification for customer ' . $order->customer_id . ' for order ' . $order->id);
            \App\Models\Notification::create([
                'customer_id' => $order->customer_id,
                'service_order_id' => $order->id,
                'title' => 'Order Confirmed',
                'message' => 'Your order #' . $order->id . ' has been approved and confirmed.',
                'is_read' => 0
            ]);
        }

        return response()->json(['message' => 'Status updated successfully', 'order' => $order]);
    }

    public function update_payment_status(Request $request, $id)
    {
        $request->validate([
            'payment_status' => 'required|string'
        ]);

        $order = ServiceOrder::find($id);
        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $order->payment_status = $request->payment_status;
        $order->save();

        return response()->json(['message' => 'Payment status updated successfully', 'order' => $order]);
    }

    public function assign_provider(Request $request, $id)
    {
        try {
            $request->validate([
                'status' => 'nullable|string',
                'provider_id' => 'nullable|exists:service_providers,id'
            ]);

            $order = ServiceOrder::with('items.offering.subService')->find($id);
            if (!$order) {
                return response()->json(['message' => 'Order not found'], 404);
            }

            if ($request->provider_id) {
                $provider = ServiceProvider::find($request->provider_id);
                
                if (!$order->items || $order->items->isEmpty()) {
                    return response()->json(['message' => 'No items found for this order'], 400);
                }

                // Get all sub-services required for this order
                $requiredSubServices = [];
                foreach ($order->items as $item) {
                    if ($item->offering && $item->offering->sub_service_id) {
                        $requiredSubServices[] = $item->offering->sub_service_id;
                    }
                }

                // Get provider's current offerings
                $providerOfferings = ServiceProviderOffering::where('service_provider_id', $provider->id)
                    ->pluck('sub_service_id')
                    ->toArray();

                // Check which sub-services the provider doesn't have
                $missingServices = array_diff($requiredSubServices, $providerOfferings);
                
                if (!empty($missingServices)) {
                    \Illuminate\Support\Facades\Log::warning('Provider missing sub-services', [
                        'provider_id' => $provider->id,
                        'order_id' => $order->id,
                        'missing_sub_service_ids' => $missingServices
                    ]);
                    
                    return response()->json([
                        'message' => 'Provider does not offer all required services for this order',
                        'missing_services_count' => count($missingServices),
                        'provider_id' => $provider->id
                    ], 422);
                }

                // Assign the provider's existing offerings to the order items
                foreach ($order->items as $item) {
                    if (!$item->offering) {
                        \Illuminate\Support\Facades\Log::warning("Offering missing for order item ID: " . $item->id);
                        continue; 
                    }
                    $subServiceId = $item->offering->sub_service_id;
                    
                    // Find the provider's existing offering for this sub-service
                    $offering = ServiceProviderOffering::where('service_provider_id', $provider->id)
                        ->where('sub_service_id', $subServiceId)
                        ->first();
                    
                    if ($offering) {
                        $item->service_provider_offering_id = $offering->id;
                        $item->save();
                    } else {
                        \Illuminate\Support\Facades\Log::error('Provider offering not found', [
                            'provider_id' => $provider->id,
                            'sub_service_id' => $subServiceId
                        ]);
                    }
                }

                // If admin explicitly sent a status update alongside provider assignment
                if ($request->status) {
                    $oldStatus = trim(strtolower($order->status));
                    $newStatus = trim(strtolower($request->status));
                    $order->status = $request->status;
                    $order->save();

                    if (($newStatus === 'confirmed' || $newStatus === 'approved' || $newStatus === 'order confirmed') && $oldStatus !== $newStatus) {
                        // Create order confirmation
                        $confirmation = new \App\Models\OrderConfirmation();
                        $confirmation->service_order_id = $order->id;
                        $confirmation->confirmation_status = 'confirmed';
                        $confirmation->final_amount = $order->total_amount;
                        $confirmation->confirmed_at = now();
                        $confirmation->save();

                        \App\Models\Notification::create([
                            'customer_id' => $order->customer_id,
                            'service_order_id' => $order->id,
                            'title' => 'Order Confirmed',
                            'message' => 'Your order #' . $order->id . ' has been approved and confirmed.',
                            'is_read' => 0
                        ]);
                    }
                }

                $message = 'Provider assigned and order confirmed successfully';
            } elseif ($request->status === 'assigned') {
                // Find or create System Provider
                $area = ServiceArea::firstOrCreate(
                    ['city_name' => 'Default City', 'area_name' => 'Default Area'],
                    ['postal_code' => '0000']
                );

                $provider = ServiceProvider::firstOrCreate(
                    ['email' => 'provider@example.com'],
                    [
                        'full_name' => 'System Provider',
                        'phone' => '00000000',
                        'city' => 'Default City',
                        'nid' => 'NID-SYSTEM',
                        'service_area_id' => $area->id,
                        'address' => 'System'
                    ]
                );

                foreach ($order->items as $item) {
                    if (!$item->offering) continue;
                    $subServiceId = $item->offering->sub_service_id;
                    $offering = ServiceProviderOffering::firstOrCreate(
                        ['service_provider_id' => $provider->id, 'sub_service_id' => $subServiceId],
                        ['price_charged' => $item->item_price]
                    );
                    $item->service_provider_offering_id = $offering->id;
                    $item->save();
                }
                
                $order->status = 'assigned';
                $order->save();
                
                $message = 'Provider assigned successfully';
            } else {
                if ($request->status) {
                    $order->status = $request->status;
                    $order->save();
                }
                $message = 'Provider status marked as Not Assigned';
            }

            return response()->json(['message' => $message]);
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('Assign Provider Error: ' . $e->getMessage());
            return response()->json(['message' => 'Error: ' . $e->getMessage()], 500);
        }
    }
}
