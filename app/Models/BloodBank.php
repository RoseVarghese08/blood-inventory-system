<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BloodBank extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'phone',
    ];
       // One Blood Bank has many Refrigerators
     public function refrigerators()
    {
        return $this->hasMany(Refrigerator::class);
    }
}