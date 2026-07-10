<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\DashboardService;

class DashboardController extends Controller
{
    protected DashboardService $dashboardService;

    public function __construct(
        DashboardService $dashboardService
    ) {
        $this->dashboardService = $dashboardService;
    }

    /**
     * Dashboard Statistics
     */
    public function index()
    {
        return response()->json([
            'success' => true,
            'data' => $this->dashboardService->getDashboard()
        ]);
    }
}