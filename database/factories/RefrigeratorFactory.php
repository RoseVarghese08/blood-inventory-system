<?php

namespace Database\Factories;

use App\Models\BloodBank;
use App\Models\Refrigerator;
use Illuminate\Database\Eloquent\Factories\Factory;

class RefrigeratorFactory extends Factory
{
    protected $model = Refrigerator::class;

    public function definition(): array
    {
        return [
            'blood_bank_id' => BloodBank::factory(),
            'name' => 'Refrigerator '.$this->faker->numberBetween(1, 20),
            'code' => 'REF-'.$this->faker->unique()->numberBetween(100, 999),
            'status' => $this->faker->randomElement([
                'active',
                'inactive',
                'maintenance',
            ]),
        ];
    }
}