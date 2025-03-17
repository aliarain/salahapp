<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePrayerTimesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prayer_times', function (Blueprint $table) {
            $table->id();
            $table->foreignId('masjid_id')->constrained()->onDelete('cascade');
            $table->date('date');
            $table->json('prayer_data'); // Stores fajr, dhuhr, asr, maghrib, isha, jummah times
            $table->string('source')->default('manual'); // Options: manual, scan, api, calculation
            $table->string('timetable_image')->nullable(); // Path to the scanned timetable image
            $table->timestamps();

            // Add unique constraint to prevent duplicate entries for the same masjid and date
            $table->unique(['masjid_id', 'date']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('prayer_times');
    }
}
