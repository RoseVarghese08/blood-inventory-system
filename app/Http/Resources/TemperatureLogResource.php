<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TemperatureLogResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [

            'id' => $this->id,

            'temperature' => $this->temperature,

            'recorded_at' => $this->recorded_at,

            'refrigerator' => [

                'id' => $this->refrigerator?->id,

                'name' => $this->refrigerator?->name,

                'code' => $this->refrigerator?->code,

            ],

        ];
    }
}