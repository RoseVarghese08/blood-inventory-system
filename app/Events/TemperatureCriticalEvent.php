<?php

namespace App\Events;

use App\Models\TemperatureLog;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class TemperatureCriticalEvent
{
    use Dispatchable, SerializesModels;

    /**
     * The temperature log that triggered the event.
     */
    public TemperatureLog $temperatureLog;

    /**
     * Create a new event instance.
     */
    public function __construct(TemperatureLog $temperatureLog)
    {
        $this->temperatureLog = $temperatureLog;
    }
}