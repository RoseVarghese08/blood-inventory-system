<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('blood_bags', function (Blueprint $table) {

            $table->id();

            $table->foreignId('refrigerator_id')
                  ->constrained()
                  ->cascadeOnDelete();

            $table->string('bag_number')->unique();

            $table->string('blood_group')->index();

            $table->string('donor_name');

            $table->date('collection_date');

            $table->date('expiry_date')->index();

            $table->integer('quantity');

            $table->enum('status', [
                'available',
                'reserved',
                'dispatched',
                'expired'
            ])->default('available')->index();

            $table->timestamps();

        });
    }

    public function down(): void
    {
        Schema::dropIfExists('blood_bags');
    }
};