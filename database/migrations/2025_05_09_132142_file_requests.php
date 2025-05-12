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
        // 'requested_by',
        // 'request_status',
        // 'created_at',
        // 'updated_at',
        Schema::create('file_requests', function (Blueprint $table) {
            $table->id('request_id');
            $table->integer('file_id');
            $table->string('requested_by');
            $table->string('request_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
