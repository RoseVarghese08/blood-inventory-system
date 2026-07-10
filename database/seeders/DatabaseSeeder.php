<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\BloodBank;
use App\Models\Refrigerator;
use App\Models\BloodBag;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create Admin User
        User::create([
            'name' => 'Admin',
            'email' => 'admin@example.com',
            'password' => bcrypt('password'),
            'role' => 'admin',
        ]);

        // Create 3 Blood Banks
        // BloodBank::factory()->count(3)->create();
        $bloodBanks = BloodBank::factory()->count(3)->create();

foreach ($bloodBanks as $bloodBank) {

    $refrigerators = Refrigerator::factory()->count(2)->create([
        'blood_bank_id' => $bloodBank->id,
    ]);

    foreach ($refrigerators as $refrigerator) {

        BloodBag::factory()->count(5)->create([
            'refrigerator_id' => $refrigerator->id,
        ]);

    }
}
    }
}