<?php

namespace App\Listeners;

use App\Events\TemperatureCriticalEvent;
use App\Models\Alert;
use App\Jobs\ProcessCriticalTemperatureAlert;

class StoreAlertListener
{
    /**
     * Handle the event.
     */
   public function handle(TemperatureCriticalEvent $event): void
{
    $alert = Alert::create([

        'refrigerator_id' => $event->temperatureLog->refrigerator_id,

        'type' => 'critical',

        'message' => 'Critical temperature detected. Current temperature: '
            . $event->temperatureLog->temperature . '°C',

        'is_resolved' => false,

    ]);

    ProcessCriticalTemperatureAlert::dispatch($alert);
}
}