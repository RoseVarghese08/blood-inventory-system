<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Refrigerator extends Model
{
    use HasFactory;

    protected $fillable = [
        'blood_bank_id',
        'name',
        'code',
        'status',
    ];

    // Refrigerator belongs to Blood Bank
    public function bloodBank()
    {
        return $this->belongsTo(BloodBank::class);
    }

    // Refrigerator has many Blood Bags
    public function bloodBags()
    {
        return $this->hasMany(BloodBag::class);
    }

    // Refrigerator has many Temperature Logs
    public function temperatureLogs()
    {
        return $this->hasMany(TemperatureLog::class);
    }

    // Refrigerator has many Alerts
    public function alerts()
    {
        return $this->hasMany(Alert::class);
    }
}