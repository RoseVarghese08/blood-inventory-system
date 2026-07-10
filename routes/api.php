<?php

use App\Http\Controllers\Api\AlertController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BloodBagController;
use App\Http\Controllers\Api\TemperatureLogController;
use App\Http\Controllers\Api\DashboardController;

// Public Routes
Route::post('/login', [AuthController::class, 'login']);

// Protected Routes (Require Sanctum Token)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'user']);
    Route::get('blood-bags/expiring', [BloodBagController::class, 'expiring']);
Route::get('blood-bags/expired', [BloodBagController::class, 'expired']);
Route::get('blood-bags/near-risk', [BloodBagController::class, 'nearRisk']);
    Route::apiResource('blood-bags', BloodBagController::class);
    Route::apiResource('temperature-logs',TemperatureLogController::class);
    Route::get('/dashboard', [DashboardController::class, 'index']);
    Route::apiResource('alerts', AlertController::class)
    ->only(['index', 'show', 'update']);
});
