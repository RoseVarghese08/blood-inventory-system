<?php

namespace Database\Factories;

use App\Models\BloodBank;
use Illuminate\Database\Eloquent\Factories\Factory;

class BloodBankFactory extends Factory
{
    protected $model = BloodBank::class;

    public function definition(): array
    {
        return [
            'name' => fake()->company(),
            'address' => fake()->address(),
            'phone' => fake()->phoneNumber(),
        ];
    }
}