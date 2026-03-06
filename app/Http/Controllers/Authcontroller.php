<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (!$token = auth('api')->attempt($credentials)) {
            return back()->withErrors([
                'email' => 'Invalid email or password'
            ]);
        }
         session(['jwt_token' => $token]);

        return redirect('/')->with('logged_in', true);
    }
    public function register(Request $request)
    {
        $request->validate([
            'fname' => 'required|string|max:255',
            'lname' => 'required|string|max:255',
            'dob' => 'required|date',
            'email' => 'required|email|unique:customers,email',
            'phone' => 'nullable|string',
            'password' => 'required|min:6',
            'address' => 'nullable|string',
            'city' => 'required|in:Dhaka,Chittagong,Sylhet,Barisal,Rangpur,Rajshahi,Khulna'
        ]);

        Customer::create([
            'fname' => $request->fname,
            'lname' => $request->lname,
            'dob' => $request->dob,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'address' => $request->address,
            'city' => $request->city,
            'preferred_payment_method' => null
        ]);

        return redirect()->route('login', ['signup' => 'success']);
    }

    public function logout()
    {
        try {
            auth('api')->logout();

            return response()->json([
                "error" => false,
                "message" => "Logged out successfully"
            ]);

        } catch (\Exception $e) {
            return response()->json([
                "error" => true,
                "message" => "Token not provided or already invalid"
            ], 400);
        }
    }
}