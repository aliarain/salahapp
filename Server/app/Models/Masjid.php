<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Masjid extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'address',
        'latitude',
        'longitude',
        'contact_info',
        'image',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'contact_info' => 'array',
        'latitude' => 'float',
        'longitude' => 'float',
    ];

    /**
     * Get the prayer times for the masjid.
     */
    public function prayerTimes()
    {
        return $this->hasMany(PrayerTime::class);
    }

    /**
     * Scope a query to find nearby masjids.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @param float $lat Latitude
     * @param float $lng Longitude
     * @param float $radius Radius in miles
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeNearby($query, $lat, $lng, $radius = 10)
    {
        // Haversine formula to calculate distance
        $haversine = "(
            6371 * acos(
                cos(radians($lat))
                * cos(radians(latitude))
                * cos(radians(longitude) - radians($lng))
                + sin(radians($lat))
                * sin(radians(latitude))
            )
        )";

        return $query->select('*')
            ->selectRaw("$haversine AS distance")
            ->whereRaw("$haversine < ?", [$radius])
            ->orderByRaw('distance');
    }

    // When creating or updating a masjid, set the location point
    protected static function booted()
    {
        static::creating(function ($masjid) {
            if ($masjid->latitude && $masjid->longitude) {
                $masjid->location = DB::raw("POINT({$masjid->longitude}, {$masjid->latitude})");
            }
        });

        static::updating(function ($masjid) {
            if ($masjid->isDirty(['latitude', 'longitude'])) {
                $masjid->location = DB::raw("POINT({$masjid->longitude}, {$masjid->latitude})");
            }
        });
    }
}