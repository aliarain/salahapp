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
        Schema::create('hadith_categories', function (Blueprint $table) {
            $table->id();
            $table->string('_id');
            $table->string('categoryArabic');
            $table->string('categoryEnglish');
            $table->string('categoryTurkish');
            $table->string('categoryUrdu');
            $table->string('categoryBangla');
            $table->string('categoryHindi');
            $table->string('categoryFrench');
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
        Schema::dropIfExists('hadith_categories');
    }
};
