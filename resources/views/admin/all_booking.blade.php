<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Bookings - Admin - Serviqo</title>
    <script>
        (function() {
            if (!localStorage.getItem("token")) {
                document.documentElement.style.display = 'none';
                window.location.replace("/login");
            }
        })();
        window.addEventListener("pageshow", function(e) {
            if (e.persisted && !localStorage.getItem("token")) {
                document.documentElement.style.display = 'none';
                window.location.replace("/login");
            }
        });
    </script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .custom-scrollbar::-webkit-scrollbar {
            width: 4px;
            height: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #10b981;
            border-radius: 10px;
        }
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }
        .modal-overlay.active {
            display: flex;
        }
        .modal-content {
            background: white;
            border-radius: 12px;
            padding: 24px;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.3s ease-out;
        }
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body class="bg-gray-50 text-gray-800 min-h-screen">

    @include('components.navbar')

    <div class="container mx-auto px-4 py-8">
        <div class="max-w-7xl mx-auto">
            <div class="flex items-center justify-between mb-8">
                <div>
                    <h1 class="text-3xl font-bold text-gray-900">All Service Bookings</h1>
                    <p class="text-gray-500 mt-1">Manage and monitor all customer service requests</p>
                </div>
                <div class="bg-green-100 text-green-700 px-4 py-2 rounded-full text-sm font-semibold">
                    Admin Portal
                </div>
            </div>

            <!-- Pending Bookings Section -->
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden border border-gray-100 p-6 mb-8">
                <div class="flex items-center justify-between mb-6 border-b border-gray-100 pb-4">
                    <h2 class="text-xl font-bold text-gray-800 flex items-center gap-2">
                        <i class="fas fa-clock text-yellow-500"></i> Pending Bookings
                    </h2>
                    <button onclick="loadBookings()" class="text-green-600 hover:text-green-700 font-semibold text-sm flex items-center gap-2">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                </div>

                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left">
                        <thead>
                            <tr class="bg-gray-50 text-gray-600 text-xs font-bold uppercase tracking-wider">
                                <th class="px-4 py-3">ID</th>
                                <th class="px-4 py-3">Customer (ID)</th>
                                <th class="px-4 py-3">Location</th>
                                <th class="px-4 py-3">Order Date</th>
                                <th class="px-4 py-3">Scheduled Date</th>
                                <th class="px-4 py-3">Total</th>
                                <th class="px-4 py-3">Payment Method</th>
                                <th class="px-4 py-3">Provider</th>
                                <th class="px-4 py-3 text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="pendingTableBody" class="text-sm divide-y divide-gray-100">
                            <tr>
                                <td colspan="9" class="py-8 text-center text-gray-400">Loading bookings...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination for Pending Bookings -->
                <div class="flex items-center justify-between mt-6 pt-6 border-t border-gray-100">
                    <div class="text-sm text-gray-600">
                        <span id="pendingPageInfo">Page 1</span>
                    </div>
                    <div class="flex gap-2">
                        <button onclick="previousPendingPage()" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition font-semibold text-sm">
                            <i class="fas fa-chevron-left"></i> Previous
                        </button>
                        <button onclick="nextPendingPage()" class="px-4 py-2 bg-green-500 hover:bg-green-600 text-white rounded-lg transition font-semibold text-sm">
                            Next <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Completed & Others Section -->
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden border border-gray-100 p-6">
                <div class="flex items-center justify-between mb-6 border-b border-gray-100 pb-4">
                    <h2 class="text-xl font-bold text-gray-800 flex items-center gap-2">
                        <i class="fas fa-check-circle text-green-500"></i> Booking History
                    </h2>
                </div>

                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left">
                        <thead>
                            <tr class="bg-gray-50 text-gray-600 text-xs font-bold uppercase tracking-wider">
                                <th class="px-4 py-3">ID</th>
                                <th class="px-4 py-3">Customer</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3">Scheduled Date</th>
                                <th class="px-4 py-3">Total</th>
                                <th class="px-4 py-3">Payment Method</th>
                                <th class="px-4 py-3">Provider</th>
                            </tr>
                        </thead>
                        <tbody id="historyTableBody" class="text-sm divide-y divide-gray-100">
                            <tr>
                                <td colspan="7" class="py-8 text-center text-gray-400">Loading history...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination for History -->
                <div class="flex items-center justify-between mt-6 pt-6 border-t border-gray-100">
                    <div class="text-sm text-gray-600">
                        <span id="historyPageInfo">Page 1</span>
                    </div>
                    <div class="flex gap-2">
                        <button onclick="previousHistoryPage()" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition font-semibold text-sm">
                            <i class="fas fa-chevron-left"></i> Previous
                        </button>
                        <button onclick="nextHistoryPage()" class="px-4 py-2 bg-green-500 hover:bg-green-600 text-white rounded-lg transition font-semibold text-sm">
                            Next <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Popup Modal -->
    <div class="modal-overlay" id="popupModal">
        <div class="modal-content">
            <h3 class="text-lg font-bold text-gray-900 mb-2" id="popupTitle">Message</h3>
            <p class="text-gray-600 mb-6" id="popupMessage">This is a message</p>
            <div class="flex justify-end gap-3" id="popupActions">
                <button onclick="closePopup()" class="px-4 py-2 bg-green-500 hover:bg-green-600 text-white font-semibold rounded-lg transition">
                    OK
                </button>
            </div>
        </div>
    </div>

    <script>
        const token = localStorage.getItem("token");
        let providersList = [];
        const itemsPerPage = 5;
        let allBookings = [];
        let pendingPage = 1;
        let historyPage = 1;

        if (!token) {
            window.location.href = "/login";
        }

        // Popup function
        function showPopup(title, message) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;
            document.getElementById('popupActions').innerHTML = `
                <button onclick="closePopup()" class="px-4 py-2 bg-green-500 hover:bg-green-600 text-white font-semibold rounded-lg transition">
                    OK
                </button>
            `;
            document.getElementById('popupModal').classList.add('active');
        }

        function showConfirmPopup(title, message, onConfirm) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;
            document.getElementById('popupActions').innerHTML = `
                <button onclick="closePopup()" class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold rounded-lg transition">
                    Cancel
                </button>
                <button onclick="confirmAction()" class="px-4 py-2 bg-green-500 hover:bg-green-600 text-white font-semibold rounded-lg transition">
                    Confirm
                </button>
            `;
            window.currentConfirmCallback = onConfirm;
            document.getElementById('popupModal').classList.add('active');
        }

        function confirmAction() {
            if (window.currentConfirmCallback) {
                window.currentConfirmCallback();
            }
            closePopup();
        }

        function closePopup() {
            document.getElementById('popupModal').classList.remove('active');
            window.currentConfirmCallback = null;
        }

        // Close popup when clicking on overlay
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('popupModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    closePopup();
                }
            });
        });

        async function fetchProviders() {
            try {
                const res = await fetch("/api/admin/providers", {
                    headers: { Authorization: "Bearer " + token }
                });
                providersList = await res.json();
                console.log('Providers loaded:', providersList.length, providersList);
            } catch (err) {
                console.error("Error fetching providers:", err);
            }
        }

        async function updateBookingStatus(id, status) {
            if (status === 'Order Confirmed') {
                const booking = allBookings.find(b => b.id === id);
                const provider = booking && booking.items && booking.items[0] && booking.items[0].offering 
                                    ? booking.items[0].offering.provider : null;
                
                if (!provider || provider.full_name === 'System Provider') {
                    showPopup('Assign Provider', 'Please assign a service provider before accepting this booking.');
                    return;
                }
            }

            const action = status === 'Order Confirmed' ? 'approve' : 'decline';
            showConfirmPopup('Confirm Action', `Are you sure you want to ${action} this booking?`, async function() {
                try {
                    const res = await fetch(`/api/admin/bookings/${id}/status`, {
                        method: 'PATCH',
                        headers: {
                            'Authorization': 'Bearer ' + token,
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ status })
                    });

                    if (res.ok) {
                        showPopup('Success', 'Booking status updated!');
                        loadBookings();
                    } else {
                        showPopup('Error', 'Failed to update status.');
                    }
                } catch (err) {
                    console.error(err);
                }
            });
        }

        async function updatePaymentStatus(id, payment_status) {
            showConfirmPopup('Confirm Payment', `Are you sure you want to mark this payment as ${payment_status}?`, async function() {
                try {
                    const res = await fetch(`/api/admin/bookings/${id}/payment-status`, {
                        method: 'PATCH',
                        headers: {
                            'Authorization': 'Bearer ' + token,
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ payment_status })
                    });

                    if (res.ok) {
                        showPopup('Success', 'Payment status updated!');
                        loadBookings();
                    } else {
                        showPopup('Error', 'Failed to update payment status.');
                    }
                } catch (err) {
                    console.error(err);
                }
            });
        }

        async function assignProvider(id, provider_id) {
            if (!provider_id) return;
            try {
                const res = await fetch(`/api/admin/bookings/${id}/assign`, {
                    method: 'PATCH',
                    headers: {
                        'Authorization': 'Bearer ' + token,
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ 
                        provider_id: provider_id,
                        status: 'assigned'
                    })
                });

                if (res.ok) {
                    showPopup('Success', 'Provider assigned successfully!');
                    loadBookings();
                } else {
                    const result = await res.json();
                    showPopup('Error', result.message || 'Failed to update provider status.');
                }
            } catch (err) {
                console.error(err);
            }
        }

        function displayPendingPage() {
            const pending = allBookings.filter(b => b.status === 'Pending' || b.status === 'pending' || b.status === 'assigned');
            const start = (pendingPage - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const pageBookings = pending.slice(start, end);
            
            const pendingBody = document.getElementById("pendingTableBody");
            pendingBody.innerHTML = pageBookings.length ? renderPending(pageBookings) : `<tr><td colspan="9" class="py-8 text-center text-gray-400">No pending bookings.</td></tr>`;
            
            document.getElementById('pendingPageInfo').textContent = `Page ${pendingPage} of ${Math.ceil(pending.length / itemsPerPage) || 1}`;
        }

        function displayHistoryPage() {
            const history = allBookings.filter(b => b.status !== 'Pending' && b.status !== 'pending' && b.status !== 'assigned');
            const start = (historyPage - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const pageBookings = history.slice(start, end);
            
            const historyBody = document.getElementById("historyTableBody");
            historyBody.innerHTML = pageBookings.length ? renderHistory(pageBookings) : `<tr><td colspan="7" class="py-8 text-center text-gray-400">No booking history.</td></tr>`;
            
            document.getElementById('historyPageInfo').textContent = `Page ${historyPage} of ${Math.ceil(history.length / itemsPerPage) || 1}`;
        }

        function nextPendingPage() {
            const pending = allBookings.filter(b => b.status === 'Pending' || b.status === 'pending' || b.status === 'assigned');
            const maxPage = Math.ceil(pending.length / itemsPerPage);
            if (pendingPage < maxPage) {
                pendingPage++;
                displayPendingPage();
            }
        }

        function previousPendingPage() {
            if (pendingPage > 1) {
                pendingPage--;
                displayPendingPage();
            }
        }

        function nextHistoryPage() {
            const history = allBookings.filter(b => b.status !== 'Pending' && b.status !== 'pending' && b.status !== 'assigned');
            const maxPage = Math.ceil(history.length / itemsPerPage);
            if (historyPage < maxPage) {
                historyPage++;
                displayHistoryPage();
            }
        }

        function previousHistoryPage() {
            if (historyPage > 1) {
                historyPage--;
                displayHistoryPage();
            }
        }

        async function loadBookings() {
            const pendingBody = document.getElementById("pendingTableBody");
            const historyBody = document.getElementById("historyTableBody");
            pendingPage = 1;
            historyPage = 1;
            
            try {
                // Fetch providers first to ensure the list is available for rendering
                await fetchProviders();

                const res = await fetch("/api/admin/all_bookings", {
                    headers: { Authorization: "Bearer " + token }
                });

                if (res.status === 401) {
                    localStorage.removeItem("token");
                    window.location.href = "/login";
                    return;
                }

                allBookings = await res.json();
                displayPendingPage();
                displayHistoryPage();

            } catch (err) {
                pendingBody.innerHTML = historyBody.innerHTML = `<tr><td colspan="9" class="py-8 text-center text-red-400">Error loading data.</td></tr>`;
            }
        }

        function renderPending(bookings) {
            return bookings.map(b => {
                const customerName = b.customer ? `${b.customer.fname} ${b.customer.lname}` : 'Guest';
                const location = b.customer ? `${b.customer.city}, ${b.customer.address || ''}` : 'N/A';
                
                const currentProvider = b.items && b.items[0] && b.items[0].offering ? b.items[0].offering.provider : null;
                const customerCity = b.customer ? b.customer.city : '';
                
                // Get all sub-service IDs required for this order
                const requiredSubServiceIds = b.items 
                    ? b.items.map(item => item.offering && item.offering.sub_service_id).filter(Boolean)
                    : [];
                
                // Get unique sub-service IDs (remove duplicates)
                const uniqueSubServiceIds = [...new Set(requiredSubServiceIds)];
                
                console.log(`========== ORDER ${b.id} ==========`);
                console.log('Required Sub-Service IDs:', uniqueSubServiceIds);
                console.log('Total Providers Available:', providersList.length);
                
                // Filter providers that:
                // 1. Exclude System Provider
                // 2. Have offerings for ALL required sub-services
                const matchingProviders = providersList.filter(p => {
                    console.log(`\n--- Checking Provider: ${p.full_name} ---`);
                    console.log(`Offered Sub-Services:`, p.offered_sub_services);
                    console.log(`Is System Provider: ${p.full_name === 'System Provider'}`);
                    
                    // System Provider check
                    if (p.full_name === 'System Provider') {
                        console.log('❌ System Provider - SKIPPED');
                        return false;
                    }
                    
                    // Check if provider has all required sub-services
                    if (uniqueSubServiceIds.length === 0) {
                        console.log('✓ No specific services required - INCLUDED');
                        return true;
                    }
                    
                    // Get provider's offered sub-services
                    const offeredServices = p.offered_sub_services || [];
                    console.log(`Offered Services Array:`, offeredServices);
                    
                    // Check if provider offers ALL required sub-services
                    const hasAllServices = uniqueSubServiceIds.every(subServiceId => {
                        const hasService = offeredServices.some(s => String(s) === String(subServiceId));
                        console.log(`  - SubService ${subServiceId}: ${hasService ? '✓' : '❌'}`);
                        return hasService;
                    });
                    
                    console.log(`Final Result: ${hasAllServices ? '✓ INCLUDED' : '❌ SKIPPED'}`);
                    return hasAllServices;
                });

                console.log(`\n========== RESULT: ${matchingProviders.length} matching providers ==========\n`);

                // Sort providers by rating (highest first) and then by name
                matchingProviders.sort((a, b) => {
                    const ratingA = a.rating || 0;
                    const ratingB = b.rating || 0;
                    if (ratingB !== ratingA) {
                        return ratingB - ratingA;
                    }
                    return (a.full_name || '').localeCompare(b.full_name || '');
                });

                // Build provider options
                let providerOptions = `<option value="">Select Provider (${matchingProviders.length} available)</option>`;
                
                // Add providers to options
                matchingProviders.forEach(p => {
                    const isSelected = currentProvider && currentProvider.id === p.id;
                    const ratingDisplay = p.rating ? ` ★${p.rating}` : '';
                    const servicesCount = (p.offered_sub_services || []).length;
                    const matchCount = uniqueSubServiceIds.filter(id => 
                        (p.offered_sub_services || []).map(String).includes(String(id))
                    ).length;
                    
                    // Show if provider offers all required services or just matches
                    const serviceMatch = matchCount === uniqueSubServiceIds.length ? '✓' : '';
                    
                    providerOptions += `<option value="${p.id}" ${isSelected ? 'selected' : ''} title="Services: ${servicesCount}, Rating: ${p.rating || 'N/A'}">${p.full_name}${ratingDisplay} ${serviceMatch}</option>`;
                });

                const paymentMethod = b.payments && b.payments[0] ? b.payments[0].payment_method.toLowerCase() : '';
                const paymentMethodDisplay = paymentMethod === 'cash' ? 'COD' : (paymentMethod === 'mobile_banking' ? 'Mobile Banking' : 'N/A');
                let paymentStatusText = b.payment_status;
                let paymentStatusClass = b.payment_status === 'paid' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700';

                if (paymentMethod === 'mobile_banking' && b.payment_status !== 'paid') {
                    paymentStatusText = 'pending payment';
                    paymentStatusClass = 'bg-yellow-100 text-yellow-700';
                } else if (paymentMethod === 'cash') {
                    paymentStatusText = 'paid';
                    paymentStatusClass = 'bg-green-100 text-green-700';
                }

                return `
                    <tr class="hover:bg-gray-50 transition">
                        <td class="px-4 py-4 font-medium text-gray-900">#${b.id}</td>
                        <td class="px-4 py-4">
                            <div class="font-semibold text-gray-800">${customerName}</div>
                            <div class="text-xs text-gray-500">ID: ${b.customer_id}</div>
                        </td>
                        <td class="px-4 py-4 text-xs text-gray-600 max-w-[150px] truncate">${location}</td>
                        <td class="px-4 py-4 text-xs text-gray-600">${new Date(b.created_at).toLocaleString()}</td>
                        <td class="px-4 py-4 text-xs font-semibold text-blue-600">${new Date(b.scheduled_datetime).toLocaleString()}</td>
                        <td class="px-4 py-4 font-bold text-gray-900">$${b.total_amount}</td>
                        <td class="px-4 py-4">
                            <div class="flex flex-col gap-1">
                                <span class="text-xs font-bold text-gray-800">${paymentMethodDisplay}</span>
                                ${paymentMethod === 'mobile_banking' && b.payment_status !== 'paid' ? `
                                    <button onclick="updatePaymentStatus(${b.id}, 'paid')" class="text-[9px] text-green-600 hover:text-green-700 font-bold underline text-left">
                                        Approve Payment
                                    </button>
                                ` : ''}
                            </div>
                        </td>
                        <td class="px-4 py-4">
                            <div class="flex flex-col gap-1">
                                <select onchange="assignProvider(${b.id}, this.value)" class="text-[11px] border rounded p-1 w-full bg-white outline-none focus:border-green-500">
                                    ${providerOptions}
                                </select>
                            </div>
                        </td>
                        <td class="px-4 py-4 text-center">
                            <div class="flex items-center justify-center gap-2">
                                <button onclick="updateBookingStatus(${b.id}, 'Order Confirmed')" class="bg-green-500 hover:bg-green-600 text-white p-2 rounded shadow-sm transition" title="Approve">
                                    <i class="fas fa-check"></i>
                                </button>
                                <button onclick="updateBookingStatus(${b.id}, 'cancelled')" class="bg-red-500 hover:bg-red-600 text-white p-2 rounded shadow-sm transition" title="Decline">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                `;
            }).join('');
        }

        function renderHistory(bookings) {
            return bookings.map(b => {
                const customerName = b.customer ? `${b.customer.fname} ${b.customer.lname}` : 'Guest';
                const providerObj = b.items && b.items[0] && b.items[0].offering && b.items[0].offering.provider 
                                    ? b.items[0].offering.provider : null;
                const provider = (providerObj && providerObj.full_name !== 'System Provider') ? providerObj.full_name : null;
                
                let statusClass = "bg-gray-100 text-gray-600";
                if (b.status === 'Order Confirmed') statusClass = "bg-green-100 text-green-600";
                if (b.status === 'completed') statusClass = "bg-blue-100 text-blue-600";
                if (b.status === 'cancelled') statusClass = "bg-red-100 text-red-600";

                const paymentMethod = b.payments && b.payments[0] ? b.payments[0].payment_method.toLowerCase() : '';
                const paymentMethodDisplay = paymentMethod === 'cash' ? 'COD' : (paymentMethod === 'mobile_banking' ? 'Mobile Banking' : 'N/A');
                let paymentStatusText = b.payment_status;
                let paymentStatusClass = b.payment_status === 'paid' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700';

                if (paymentMethod === 'mobile_banking' && b.payment_status !== 'paid') {
                    paymentStatusText = 'pending payment';
                    paymentStatusClass = 'bg-yellow-100 text-yellow-700';
                } else if (paymentMethod === 'cash') {
                    paymentStatusText = 'paid';
                    paymentStatusClass = 'bg-green-100 text-green-700';
                }

                return `
                    <tr class="hover:bg-gray-50 transition border-b border-gray-50">
                        <td class="px-4 py-4 font-medium text-gray-900">#${b.id}</td>
                        <td class="px-4 py-4 text-gray-600">${customerName}</td>
                        <td class="px-4 py-4">
                            <span class="px-3 py-1 rounded-full text-[10px] font-bold uppercase ${statusClass}">
                                ${b.status}
                            </span>
                        </td>
                        <td class="px-4 py-4 text-xs text-gray-600">${new Date(b.scheduled_datetime).toLocaleString()}</td>
                        <td class="px-4 py-4 font-bold text-gray-900">$${b.total_amount}</td>
                        <td class="px-4 py-4">
                            <div class="flex flex-col gap-1">
                                <span class="text-xs font-bold text-gray-800">${paymentMethodDisplay}</span>
                            </div>
                        </td>
                        <td class="px-4 py-4">
                            ${provider 
                                ? `<div class="flex flex-col">
                                     <span class="text-[10px] font-bold text-green-600 uppercase">Assigned</span>
                                     <span class="text-xs text-gray-700 font-medium">${provider}</span>
                                   </div>`
                                : `<span class="text-[10px] font-bold text-red-500 uppercase">Not Assigned</span>`
                            }
                        </td>
                    </tr>
                `;
            }).join('');
        }
 window.addEventListener("pageshow", function (event) {
            if (event.persisted) {
                if (!localStorage.getItem("token")) {
                    window.location.replace("/login");
                }
            }
        });

        document.addEventListener("DOMContentLoaded", () => {
            loadBookings();
        });
    </script>
</body>

</html>