<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Alert extends Model
{
    use HasFactory;

    protected $fillable = [
        'refrigerator_id',
        'type',
        'message',
        'is_resolved',
    ];

    protected $casts = [
        'is_resolved' => 'boolean',
    ];

    // Alert belongs to Refrigerator
    public function refrigerator()
    {
        return $this->belongsTo(Refrigerator::class);
    }
}