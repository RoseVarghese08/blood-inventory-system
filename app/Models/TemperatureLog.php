<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TemperatureLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'refrigerator_id',
        'temperature',
        'recorded_at',
    ];

    protected $casts = [
        'recorded_at' => 'datetime',
    ];

    /**
     * Temperature Log belongs to Refrigerator
     */
    public function refrigerator()
    {
        return $this->belongsTo(Refrigerator::class);
    }
}