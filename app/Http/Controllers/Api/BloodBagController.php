<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBloodBagRequest;
use App\Http\Requests\UpdateBloodBagRequest;
use App\Http\Resources\BloodBagResource;
use App\Models\BloodBag;
use App\Services\BloodBagService;
use Illuminate\Http\JsonResponse;

class BloodBagController extends Controller
{
    protected BloodBagService $bloodBagService;

    public function __construct(BloodBagService $bloodBagService)
    {
        $this->bloodBagService = $bloodBagService;
    }

    /**
     * Display all blood bags.
     */
    public function index()
    {
        $bloodBags = $this->bloodBagService->getAll();

        return BloodBagResource::collection($bloodBags);
    }

    /**
     * Store a newly created blood bag.
     */
    public function store(StoreBloodBagRequest $request)
    {
        $bloodBag = $this->bloodBagService->create(
            $request->validated()
        );

        return new BloodBagResource($bloodBag);
    }

    /**
     * Display a specific blood bag.
     */
    public function show(BloodBag $bloodBag)
    {
        $bloodBag = $this->bloodBagService->getById($bloodBag);

        return new BloodBagResource($bloodBag);
    }

    /**
     * Update a blood bag.
     */
    public function update(
        UpdateBloodBagRequest $request,
        BloodBag $bloodBag
    ) {
        $bloodBag = $this->bloodBagService->update(
            $bloodBag,
            $request->validated()
        );

        return new BloodBagResource($bloodBag);
    }

    /**
     * Delete a blood bag.
     */
    public function destroy(BloodBag $bloodBag): JsonResponse
    {
        $this->bloodBagService->delete($bloodBag);

        return response()->json([
            'success' => true,
            'message' => 'Blood Bag deleted successfully.'
        ]);
    }
    /**
 * Blood bags expiring within 24 hours.
 */
public function expiring()
{
    return BloodBagResource::collection(
        $this->bloodBagService->expiringWithin24Hours()
    );
}

/**
 * Already expired blood bags.
 */
public function expired()
{
    return BloodBagResource::collection(
        $this->bloodBagService->expiredBags()
    );
}

/**
 * Near-risk inventory percentage.
 */
public function nearRisk()
{
    return response()->json([
        'success' => true,
        'near_risk_percentage' => $this->bloodBagService->nearRiskPercentage()
    ]);
}
}