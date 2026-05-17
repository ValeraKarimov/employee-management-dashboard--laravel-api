<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProfileResource;
use App\Models\User;
use Illuminate\Http\Request;

class UserProfileController extends Controller
{
    public function show(User $user)
    {

        $profile = $user->profile;

        if (! $profile) {
            return response()->json([
                'data' => null,
            ]);
        }

    // return response()->json([
        //     'data' => $user->profile,
        // ]);

        return new ProfileResource($profile);

    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'phone' => ['nullable', 'string', 'max:50'],
            'address' => ['nullable', 'string', 'max:255'],
            'birth_date' => ['nullable', 'date'],
            'position' => ['nullable', 'string', 'max:100'],
            'department' => ['nullable', 'string', 'max:100'],
        ]);

        $profile = $user->profile()->updateOrCreate(
            ['user_id' => $user->id],
            $validated
        );

        // return response()->json([
        //     'message' => 'User profile updated successfully.',
        //     'data' => $profile,
        // ]);

        return response()->json([
            'message' => 'User profile updated successfully.',
            'data' => new ProfileResource($profile),
        ]);
        
    }
}