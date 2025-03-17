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
        Schema::create('hadiths', function (Blueprint $table) {
            $table->id();
            $table->string('_id');
            $table->string('narratedBy');
            $table->string('referenceBook');
            $table->string('category_id');
            $table->text('hadithArabic');
            $table->text('hadithEnglish');
            $table->text('hadithTurkish');
            $table->text('hadithUrdu');
            $table->text('hadithBangla');
            $table->text('hadithHindi');
            $table->text('hadithFrench');
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
        Schema::dropIfExists('hadiths');
    }
};
