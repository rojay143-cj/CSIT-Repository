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
        Schema::create('file_category', function (Blueprint $table) {
            $table->id('category_id');
            $table->foreignId('file_id');
            $table->enum('category_name', ['Capstone', 'Thesis', 'Accreditation', 'Faculty Request', 'Admin Docs']);
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('file_category');
    }
};
