<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ResolveAlertRequest;
use App\Http\Resources\AlertResource;
use App\Models\Alert;
use App\Services\AlertService;

class AlertController extends Controller
{
    public function __construct(
        protected AlertService $alertService
    ) {}

    /**
     * GET /api/alerts
     */
    public function index()
    {
        return AlertResource::collection(
            $this->alertService->getAll()
        );
    }

    /**
     * GET /api/alerts/{alert}
     */
    public function show(Alert $alert)
    {
        return new AlertResource(
            $this->alertService->getById($alert)
        );
    }

    /**
     * PATCH /api/alerts/{alert}/resolve
     */
    public function update(
        ResolveAlertRequest $request,
        Alert $alert
    ) {
        return new AlertResource(
            $this->alertService->resolve(
                $alert,
                $request->validated()
            )
        );
    }

    public function store() {}
    public function destroy() {}
}