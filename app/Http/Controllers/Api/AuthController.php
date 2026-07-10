<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    /**
     * Login User
     */
    public function login(Request $request)
    {
        // Validate Request
        $validated = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        // Check Credentials
        if (!Auth::attempt($validated)) {

            return response()->json([
                'success' => false,
                'message' => 'Invalid credentials.'
            ], 401);
        }

        // Get Authenticated User
        $user = Auth::user();

        // Delete Old Tokens (Optional)
        $user->tokens()->delete();

        // Create New Token
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([

            'success' => true,

            'message' => 'Login successful.',

            'token' => $token,

            'token_type' => 'Bearer',

            'user' => [

                'id' => $user->id,

                'name' => $user->name,

                'email' => $user->email,

                'role' => $user->role,

            ]

        ], 200);
    }

    /**
     * Logout User
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([

            'success' => true,

            'message' => 'Logged out successfully.'

        ], 200);
    }

    /**
     * Current Logged User
     */
  public function user(Request $request)
{
    $user = $request->user();

    return response()->json([
        'success' => true,
        'user' => [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'role' => $user->role,
        ]
    ]);
}
}