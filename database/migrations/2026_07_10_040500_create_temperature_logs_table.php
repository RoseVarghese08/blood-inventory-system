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
    Schema::create('temperature_logs', function (Blueprint $table) {

        $table->id();
$table->foreignId('refrigerator_id')
      ->constrained()
      ->cascadeOnDelete();

$table->decimal('temperature', 4, 2)->index();

$table->timestamp('recorded_at')->index();
        $table->timestamps();

    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('temperature_logs');
    }
};
