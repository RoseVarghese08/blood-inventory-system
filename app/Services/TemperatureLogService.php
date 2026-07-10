<?php

namespace App\Services;

use App\Models\TemperatureLog;
use App\Events\TemperatureCriticalEvent;

class TemperatureLogService
{
    /**
     * Get all temperature logs.
     */
    public function getAll()
    {
        return TemperatureLog::with('refrigerator')
            ->latest('recorded_at')
            ->get();
    }

    /**
     * Get one temperature log.
     */
    public function getById(TemperatureLog $temperatureLog)
    {
        return $temperatureLog->load('refrigerator');
    }

    /**
     * Store temperature log.
     */
 public function create(array $data)
{
    // Create the temperature log
    $temperatureLog = TemperatureLog::create($data);

    // Fire event if temperature is critical (> 8°C)
    if ($temperatureLog->temperature > 8) {
        event(new TemperatureCriticalEvent($temperatureLog));
    }

    return $temperatureLog;
}

    /**
     * Update temperature log.
     */
    public function update(TemperatureLog $temperatureLog, array $data)
    {
        $temperatureLog->update($data);

        return $temperatureLog;
    }

    /**
     * Delete temperature log.
     */
    public function delete(TemperatureLog $temperatureLog)
    {
        return $temperatureLog->delete();
    }
}