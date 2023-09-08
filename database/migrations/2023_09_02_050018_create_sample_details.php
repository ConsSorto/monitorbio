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
        Schema::create('sample_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('sample_id')->nullable();
            $table->foreign('sample_id')->references('id')->on('samples');
            $table->string('bottlenumber', 20);
            $table->string('picker', 200);
            $table->date('datepicker');
            $table->unsignedBigInteger('period_id');
            $table->foreign('period_id')->references('id')->on('catalogs');
            $table->string('order', 200);
            $table->string('family', 200);
            $table->string('subfamily', 200);
            $table->string('gender', 200);
            $table->string('species', 200);
            $table->string('genitaliascore', 200);
            $table->string('finalscore', 200);
            $table->unsignedBigInteger('sex_id');
            $table->foreign('sex_id')->references('id')->on('catalogs');
            $table->float('quantity', 18,2);
            $table->float('size', 18,2);
            $table->unsignedBigInteger('color_id');
            $table->foreign('color_id')->references('id')->on('catalogs');
            $table->string('identifier', 200);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sample_details');
    }
};
