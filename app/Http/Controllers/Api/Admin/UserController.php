<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        // return response()->json([
        //     'data' => User::query()
        //         ->select('id', 'name', 'email', 'role', 'created_at')
        //         ->latest()
        //         ->get(),
        // ]);

        $users = User::query()
            ->latest()
            ->get();

        return UserResource::collection($users);
    }

    public function show(User $user)
    {
        // return response()->json([
        //     'data' => $user->only([
        //         'id',
        //         'name',
        //         'email',
        //         'role',
        //         'created_at',
        //         'updated_at',
        //     ]),
        // ]);

        $user->load([            
            'profile',
            'documents',
            'leaveRequests',
            'shifts',
        ]);

        return new UserResource($user);

    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', 'string', 'min:8'],
            'role' => ['required', 'in:admin,employee'],
            'department' => ['required', 'max:255'],
            'position' => ['required', 'max:255'],
            'status' => ['required', 'max:255']
        ]);

        $user = User::create($validated);

        // return response()->json([
        //     'message' => 'User created successfully.',
        //     'data' => $user->only(['id', 'name', 'email', 'role', 'created_at']),
        // ], 201);

        return response()->json([
            'message' => 'User updated successfully.',
            'data' => new UserResource($user),
        ]);

    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => ['sometimes', 'required', 'string', 'max:255'],
            'email' => ['sometimes', 'required', 'email', 'max:255', 'unique:users,email,' . $user->id],
            'password' => ['nullable', 'string', 'min:8'],
            'role' => ['sometimes', 'required', 'in:admin,employee'],
            'department' => ['sometimes', 'required', 'max:255'],
            'position' => ['sometimes', 'required', 'max:255'],
            'status' => ['sometimes', 'required', 'max:255']
        ]);

        if (array_key_exists('password', $validated) && $validated['password'] === null) {
            unset($validated['password']);
        }

        $user->update($validated);

        return response()->json([
            'message' => 'User updated successfully.',
            'data' => $user->only(['id', 'name', 'email', 'role', 'updated_at']),
        ]);
    }

    public function destroy(User $user)
    {
        if (auth()->id() === $user->id) {
            return response()->json([
                'message' => 'You cannot delete your own account.',
            ], 403);
        }

        $user->delete();

        return response()->json([
            'message' => 'User deleted successfully.',
        ]);
    }
}