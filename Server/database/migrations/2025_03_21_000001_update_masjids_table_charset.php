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
        // Set the default character set and collation for the table
        DB::statement('ALTER TABLE masjids CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // Update specific text columns
        DB::statement('ALTER TABLE masjids MODIFY name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        DB::statement('ALTER TABLE masjids MODIFY address VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        DB::statement('ALTER TABLE masjids MODIFY timezone VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // If needed, you can revert to the original character set
        DB::statement('ALTER TABLE masjids CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci');
    }
};
