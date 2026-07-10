<?php

namespace App\Services;

use App\Models\BloodBag;
use App\Models\Refrigerator;
use App\Models\Alert;
use Illuminate\Support\Facades\Cache;

class DashboardService
{
    protected TemperatureAnalyticsService $analytics;

    public function __construct(
        TemperatureAnalyticsService $analytics
    )
    {
        $this->analytics = $analytics;
    }

    /**
     * Dashboard Statistics
     */
  
    public function getDashboard()
{
    return Cache::remember(
        'dashboard-data',
        now()->addMinutes(5),
        function () {

            return [

                'blood_banks' => \App\Models\BloodBank::count(),

                'refrigerators' => \App\Models\Refrigerator::count(),

                'blood_bags' => \App\Models\BloodBag::count(),

                'available_blood_bags' => \App\Models\BloodBag::where(
                    'status',
                    'available'
                )->count(),

                'expired_blood_bags' => \App\Models\BloodBag::where(
                    'status',
                    'expired'
                )->count(),

                'critical_alerts' => \App\Models\Alert::where(
                    'is_resolved',
                    false
                )->count(),

            ];

        }
    );
}
}