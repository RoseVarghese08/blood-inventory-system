<?php

namespace App\Jobs;

use App\Models\Alert;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\User;
use App\Notifications\CriticalTemperatureNotification;

class ProcessCriticalTemperatureAlert implements ShouldQueue
{
    use Queueable, InteractsWithQueue, SerializesModels;

    /**
     * Alert instance.
     */
    public Alert $alert;

    /**
     * Create a new job instance.
     */
    public function __construct(Alert $alert)
    {
        $this->alert = $alert;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
{
    logger()->info(
        'Processing Critical Temperature Alert',
        [
            'alert_id' => $this->alert->id,
        ]
    );

    User::where('role', 'admin')
        ->each(function ($user) {
            $user->notify(
                new CriticalTemperatureNotification($this->alert)
            );
        });
}
}