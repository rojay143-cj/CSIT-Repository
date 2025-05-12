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
        // 'file_id',
        // 'version_number',
        // 'filename',
        // 'file_path',
        // 'file_size',
        // 'file_type',
        // 'uploaded_by',
        // 'status',
        // 'category',
        // 'created_at',
        // 'updated_at',
        Schema::create('file_versions', function (Blueprint $table) {
            $table->id('version_id');
            $table->integer('file_id');
            $table->integer('version_number');
            $table->string('filename');
            $table->string('file_path');
            $table->integer('file_size');
            $table->string('file_type');
            $table->string('uploaded_by');
            $table->string('status');
            $table->string('category');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('file_versions');
    }
};
