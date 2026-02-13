<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ratings_reviews', function (Blueprint $table) {
            $table->id(); // ReviewID (PK)

            $table->foreignId('customer_id') // CustomerID (FK)
                ->constrained()
                ->cascadeOnDelete();

            $table->foreignId('service_provider_id') // ProviderID (FK)
                ->constrained()
                ->cascadeOnDelete();

            $table->foreignId('service_order_id') // OrderID (FK)
                ->constrained()
                ->cascadeOnDelete();

            $table->integer('rating'); // e.g. 1–5

            $table->date('review_date')->useCurrent();

            $table->text('review_notes')->nullable();

            // ✅ Prevent multiple reviews per order
            $table->unique(['customer_id', 'service_order_id']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ratings_reviews');
    }
};
