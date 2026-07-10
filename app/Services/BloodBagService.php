<?php

namespace App\Services;

use App\Models\BloodBag;
use Carbon\Carbon;

class BloodBagService
{
    /**
     * Get all blood bags with refrigerator.
     */
    public function getAll()
    {
        return BloodBag::with('refrigerator')->get();
    }

    /**
     * Get single blood bag.
     */
    public function getById(BloodBag $bloodBag)
    {
        return $bloodBag->load('refrigerator');
    }

    /**
     * Store new blood bag.
     */
    public function create(array $data)
    {
        return BloodBag::create($data);
    }

    /**
     * Update blood bag.
     */
    public function update(BloodBag $bloodBag, array $data)
    {
        $bloodBag->update($data);

        return $bloodBag;
    }

    /**
     * Delete blood bag.
     */
    public function delete(BloodBag $bloodBag)
    {
        return $bloodBag->delete();
    }
    /**
 * Blood bags expiring within the next 24 hours.
 */
public function expiringWithin24Hours()
{
    return BloodBag::whereBetween('expiry_date', [
        Carbon::now(),
        Carbon::now()->addDay()
    ])->get();
}

/**
 * Already expired blood bags.
 */
public function expiredBags()
{
    return BloodBag::where('expiry_date', '<', Carbon::now())->get();
}

/**
 * Near-risk inventory percentage.
 */
public function nearRiskPercentage()
{
    $total = BloodBag::count();

    if ($total == 0) {
        return 0;
    }

    $nearRisk = BloodBag::whereBetween('expiry_date', [
        Carbon::now(),
        Carbon::now()->addDay()
    ])->count();

    return round(($nearRisk / $total) * 100, 2);
}
}