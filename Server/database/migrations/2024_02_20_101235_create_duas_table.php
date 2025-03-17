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
        Schema::create('duas', function (Blueprint $table) {
            $table->id();
            $table->string('_id');
            $table->text('duaArabic');
            $table->text('duaEnglish');
            $table->text('duaTurkish');
            $table->text('duaUrdu');
            $table->text('duaBangla');
            $table->text('duaHindi');
            $table->text('duaFrench');
            $table->string('titleArabic');
            $table->string('titleEnglish');
            $table->string('titleTurkish');
            $table->string('titleUrdu');
            $table->string('titleBangla');
            $table->string('titleHindi');
            $table->string('titleFrench');
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
        Schema::dropIfExists('duas');
    }
};
