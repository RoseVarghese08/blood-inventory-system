<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class BloodBag extends Model
{
    use HasFactory;

    protected $fillable = [
        'refrigerator_id',
        'bag_number',
        'blood_group',
        'donor_name',
        'collection_date',
        'expiry_date',
        'quantity',
        'status',
    ];

    protected $casts = [
        'collection_date' => 'date',
        'expiry_date' => 'date',
    ];

    public function refrigerator()
    {
        return $this->belongsTo(Refrigerator::class);
    }

    protected function quantityInLiters(): Attribute
    {
        return Attribute::make(
           get: fn ($value, $attributes) => $attributes['quantity'] / 1000,
        );
    }

    protected function donorName(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => strtoupper($value),
        );
    }
}