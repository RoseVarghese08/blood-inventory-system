<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AlertResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,

            'type' => $this->type,

            'message' => $this->message,

            'is_resolved' => $this->is_resolved,

            'created_at' => $this->created_at,

            'refrigerator' => [
                'id' => $this->refrigerator->id,
                'name' => $this->refrigerator->name,
                'code' => $this->refrigerator->code,
            ],
        ];
    }
}