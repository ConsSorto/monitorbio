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
        Schema::create('samples', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('forest_region_id')->nullable();
            $table->foreign('forest_region_id')->references('id')->on('forest_regions');
            $table->string('code', 20)->unique();
            $table->string('name', 200)->unique();
            $table->unsignedBigInteger('department_id')->nullable();
            $table->foreign('department_id')->references('id')->on('departments');
            $table->unsignedBigInteger('municipality_id')->nullable();
            $table->foreign('municipality_id')->references('id')->on('municipalities');
            $table->foreign(['municipality_id', 'department_id'])->references(['id', 'department_id'])->on('municipalities');
            $table->string('place', 200);
            $table->float("utmx", 18, 2);
            $table->float("utmy", 18, 2);
            $table->float("msmn", 18, 2);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('samples');
    }
};
