<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RatingsReview extends Model
{
    protected $fillable = [
        'customer_id',
        'service_provider_id',
        'service_order_id',
        'rating',
        'review_date',
        'review_notes'
    ];

    protected $casts = [
        'review_date' => 'date',
    ];

    public function serviceProvider()
    {
        return $this->belongsTo(ServiceProvider::class, 'service_provider_id');
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }
}
