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
        Schema::create('zakats', function (Blueprint $table) {
            $table->id();
            $table->string('_id');
            $table->double('USD');
            $table->double('BDT');
            $table->double('INR');
            $table->double('PKR');
            $table->double('IDR');
            $table->double('TRY');
            $table->double('MYR');
            $table->double('SAR');
            $table->integer('zakatId');
            $table->bigInteger('timestamp');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('zakats');
    }
};
