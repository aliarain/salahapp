<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCoordinatesToMasjidsTable extends Migration
{
    public function up()
    {
        Schema::table('masjids', function (Blueprint $table) {
            // If you don't already have latitude and longitude columns
            if (!Schema::hasColumn('masjids', 'latitude')) {
                $table->decimal('latitude', 10, 7)->nullable();
            }
            if (!Schema::hasColumn('masjids', 'longitude')) {
                $table->decimal('longitude', 10, 7)->nullable();
            }

            // Add index for faster queries
            $table->index(['latitude', 'longitude']);
        });
    }

    public function down()
    {
        Schema::table('masjids', function (Blueprint $table) {
            // Drop the index
            $table->dropIndex(['latitude', 'longitude']);

            // Only drop if you added them in this migration
            // $table->dropColumn(['latitude', 'longitude']);
        });
    }
}