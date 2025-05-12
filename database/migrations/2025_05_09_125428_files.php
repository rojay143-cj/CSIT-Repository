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
        // 'filename',
        // 'file_path',
        // 'file_size',
        // 'file_type',
        // 'uploaded_by',
        // 'category',
        // 'published_by',
        // 'year_published',
        // 'uploaded_by',
        // 'description',
        // 'status',
        Schema::create('files', function (Blueprint $table) {
            $table->id('file_id');
            $table->string('filename');
            $table->string('file_path');
            $table->integer('file_size');
            $table->string('file_type');
            $table->string('uploaded_by');
            $table->string('category');
            $table->string('published_by');
            $table->string('year_published');
            $table->string('description');
            $table->string('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('files');
    }
};
