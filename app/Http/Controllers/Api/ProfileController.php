<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProfileResource;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
        public function show(Request $request)
    {
        $profile = $request->user()->profile;

        if (! $profile) {
            return response()->json([
                'data' => null,
            ]);
        }

        // return response()->json([
        //     'data' => $profile,
        // ]);

        return new ProfileResource($profile);

    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            'phone' => ['nullable', 'string', 'max:50'],
            'address' => ['nullable', 'string', 'max:255'],
            'birth_date' => ['nullable', 'date'],
            'position' => ['nullable', 'string', 'max:100'],
            'department' => ['nullable', 'string', 'max:100'],
        ]);

        $profile = $request->user()->profile()->updateOrCreate(
            ['user_id' => $request->user()->id],
            $validated
        );

        return response()->json([
            'message' => 'Profile updated successfully.',
            'data' => new ProfileResource($profile),
            // 'data' => $profile,
        ]);
    }
}
