<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTemperatureLogRequest;
use App\Http\Requests\UpdateTemperatureLogRequest;
use App\Http\Resources\TemperatureLogResource;
use App\Models\TemperatureLog;
use App\Services\TemperatureLogService;
use Illuminate\Http\JsonResponse;

class TemperatureLogController extends Controller
{
    protected TemperatureLogService $temperatureLogService;

    public function __construct(
        TemperatureLogService $temperatureLogService
    ) {
        $this->temperatureLogService = $temperatureLogService;
    }

    public function index()
    {
        return TemperatureLogResource::collection(
            $this->temperatureLogService->getAll()
        );
    }

    public function store(StoreTemperatureLogRequest $request)
    {
        $temperatureLog = $this->temperatureLogService->create(
            $request->validated()
        );

        return new TemperatureLogResource($temperatureLog);
    }

    public function show(TemperatureLog $temperatureLog)
    {
        return new TemperatureLogResource(
            $this->temperatureLogService->getById($temperatureLog)
        );
    }

    public function update(
        UpdateTemperatureLogRequest $request,
        TemperatureLog $temperatureLog
    ) {
        $temperatureLog = $this->temperatureLogService->update(
            $temperatureLog,
            $request->validated()
        );

        return new TemperatureLogResource($temperatureLog);
    }

    public function destroy(
        TemperatureLog $temperatureLog
    ): JsonResponse {

        $this->temperatureLogService->delete($temperatureLog);

        return response()->json([
            'success' => true,
            'message' => 'Temperature Log deleted successfully.'
        ]);
    }
}