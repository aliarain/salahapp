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
        Schema::create('azkars', function (Blueprint $table) {
            $table->id();
            $table->string('_id');
            $table->string('azkarEnglish');
            $table->string('azkarArabic');
            $table->string('azkarTurkish');
            $table->string('azkarUrdu');
            $table->string('azkarBangla');
            $table->string('azkarHindi');
            $table->string('azkarFrench');
            $table->string('category_id');
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
        Schema::dropIfExists('azkars');
    }
};
