<?php

namespace App\Notifications;

use App\Models\Alert;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;

class CriticalTemperatureNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public function __construct(
        public Alert $alert
    ) {
    }

    public function via(object $notifiable): array
    {
        return ['database'];
    }

    public function toArray(object $notifiable): array
    {
        return [
            'alert_id' => $this->alert->id,
            'type' => $this->alert->type,
            'message' => $this->alert->message,
            'refrigerator_id' => $this->alert->refrigerator_id,
        ];
    }
}