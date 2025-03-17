<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrayerTime extends Model
{
    use HasFactory;

    protected $fillable = [
        'masjid_id',
        'date',
        'prayer_data',
        'source',
        'timetable_image',
    ];

    protected $casts = [
        'prayer_data' => 'array',
        'date' => 'date',
    ];

    public function masjid()
    {
        return $this->belongsTo(Masjid::class);
    }
}