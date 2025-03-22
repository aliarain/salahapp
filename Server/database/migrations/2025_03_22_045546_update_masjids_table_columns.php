<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('masjids', function (Blueprint $table) {
            // Modify existing columns instead of adding new ones
            $table->json('contact_info')->nullable()->change();
            $table->integer('calculation_method')->nullable()->change();
            $table->integer('asr_method')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('masjids', function (Blueprint $table) {
            // Revert changes if needed
            $table->string('contact_info')->nullable()->change();
            $table->string('calculation_method')->nullable()->change();
            $table->string('asr_method')->nullable()->change();
        });
    }
};