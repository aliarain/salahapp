<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('masjids', function (Blueprint $table) {
            $table->string('timezone')->default('UTC');
            $table->integer('calculation_method')->default(1);
            $table->integer('asr_method')->default(1);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('masjids', function (Blueprint $table) {
            $table->dropColumn(['timezone', 'calculation_method', 'asr_method', 'city', 'country']);
        });
    }
};