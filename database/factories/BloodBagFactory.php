<?php

namespace Database\Factories;

use App\Models\BloodBag;
use App\Models\Refrigerator;
use Illuminate\Database\Eloquent\Factories\Factory;

class BloodBagFactory extends Factory
{
    protected $model = BloodBag::class;

    public function definition(): array
    {
        // Generate an expiry date between 10 days ago and 30 days from now
        $expiryDate = fake()->dateTimeBetween('-10 days', '+30 days');

        // Decide status based on expiry date
        if ($expiryDate < now()) {
            $status = 'expired';
        } else {
            $status = fake()->randomElement([
                'available',
                'reserved',
                'dispatched',
            ]);
        }

        return [
            'refrigerator_id' => Refrigerator::inRandomOrder()->first()->id,

            'bag_number' => 'BB-' . fake()->unique()->numerify('#####'),

            'blood_group' => fake()->randomElement([
                'A+',
                'A-',
                'B+',
                'B-',
                'AB+',
                'AB-',
                'O+',
                'O-',
            ]),

            'donor_name' => fake()->name(),

            'collection_date' => fake()->dateTimeBetween('-20 days', 'now'),

            'expiry_date' => $expiryDate,

            'quantity' => fake()->randomElement([
                250,
                350,
                450,
            ]),

            'status' => $status,
        ];
    }
}