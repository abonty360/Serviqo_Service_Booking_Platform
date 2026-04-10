<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServiceProvider extends Model
{
    protected $fillable = ['full_name', 'email', 'phone', 'address', 'city', 'rating', 'nid', 'service_area_id', 'region'];

    public function serviceArea()
    {
        return $this->belongsTo(ServiceArea::class);
    }

    public function ratings()
    {
        return $this->hasMany(RatingsReview::class, 'service_provider_id');
    }

    /**
     * Calculate and update the average rating for this provider
     */
    public function updateAverageRating()
    {
        // Use a fresh query to get all ratings for this provider
        $averageRating = RatingsReview::where('service_provider_id', $this->id)
            ->avg('rating') ?? 0;
        
        $averageRating = round($averageRating, 2);
        
        \Log::info('Updating provider average rating', [
            'provider_id' => $this->id,
            'new_average_rating' => $averageRating
        ]);
        
        $this->update(['rating' => $averageRating]);
        
        \Log::info('Provider rating updated in database', [
            'provider_id' => $this->id,
            'rating_value' => $averageRating
        ]);
        
        return $averageRating;
    }
}
