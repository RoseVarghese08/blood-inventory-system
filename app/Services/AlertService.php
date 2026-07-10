<?php

namespace App\Services;

use App\Models\Alert;

class AlertService
{
    /**
     * Get all alerts.
     */
    public function getAll()
    {
        return Alert::with('refrigerator')
            ->latest()
            ->get();
    }

    /**
     * Get one alert.
     */
    public function getById(Alert $alert)
    {
        return $alert->load('refrigerator');
    }

    /**
     * Resolve an alert.
     */
    public function resolve(Alert $alert, array $data)
    {
        $alert->update([
            'is_resolved' => $data['is_resolved'],
        ]);

        return $alert;
    }
}