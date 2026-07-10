<?php

namespace App\Services;

use App\Models\TemperatureLog;
use Carbon\Carbon;

class TemperatureAnalyticsService
{
    /**
     * Daily Average Temperature
     */
    public function dailyAverage(int $refrigeratorId)
    {
        return TemperatureLog::where('refrigerator_id', $refrigeratorId)
            ->whereDate('recorded_at', Carbon::today())
            ->avg('temperature');
    }

    /**
     * Highest Temperature Today
     */
    public function highestTemperature(int $refrigeratorId)
    {
        return TemperatureLog::where('refrigerator_id', $refrigeratorId)
            ->whereDate('recorded_at', Carbon::today())
            ->max('temperature');
    }

    /**
     * Lowest Temperature Today
     */

    public function lowestTemperature(int $refrigeratorId)
    {
        return TemperatureLog::where('refrigerator_id', $refrigeratorId)
            ->whereDate('recorded_at', Carbon::today())
            ->min('temperature');
    }
    /**
 * Total Unsafe Minutes Today
 */
public function unsafeMinutes(int $refrigeratorId)
{
    return TemperatureLog::where('refrigerator_id', $refrigeratorId)
        ->whereDate('recorded_at', Carbon::today())
        ->where(function ($query) {
            $query->where('temperature', '<', 2)
                  ->orWhere('temperature', '>', 6);
        })
        ->count();
}
/**
 * Risk Percentage
 */
public function riskPercentage(int $refrigeratorId)
{
    $totalMinutes = TemperatureLog::where('refrigerator_id', $refrigeratorId)
        ->whereDate('recorded_at', Carbon::today())
        ->count();

    if ($totalMinutes == 0) {
        return 0;
    }

    $unsafeMinutes = $this->unsafeMinutes($refrigeratorId);

    return round(($unsafeMinutes / $totalMinutes) * 100, 2);
}
/**
 * Refrigerator Health Score
 */
public function healthScore(int $refrigeratorId)
{
    return round(100 - $this->riskPercentage($refrigeratorId), 2);
}
}