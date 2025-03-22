<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Fix database encoding
        DB::statement('ALTER DATABASE `' . env('DB_DATABASE') . '` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // Fix table encoding
        DB::statement('ALTER TABLE masjids CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // Fix specific text columns
        DB::statement('ALTER TABLE masjids MODIFY name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        DB::statement('ALTER TABLE masjids MODIFY address VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // Add more columns if needed:
        // DB::statement('ALTER TABLE masjids MODIFY city VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        // DB::statement('ALTER TABLE masjids MODIFY country VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // No reverting needed
    }
};