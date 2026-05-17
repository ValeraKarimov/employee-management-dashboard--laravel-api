<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        return response()->json([
            'data' => User::query()
                ->select('id', 'name', 'email', 'role', 'created_at')
                ->latest()
                ->get(),
        ]);
    }

    public function show(User $user)
    {
        return response()->json([
            'data' => $user->only([
                'id',
                'name',
                'email',
                'role',
                'created_at',
                'updated_at',
            ]),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', 'string', 'min:8'],
            'role' => ['required', 'in:admin,employee'],
        ]);

        $user = User::create($validated);

        return response()->json([
            'message' => 'User created successfully.',
            'data' => $user->only(['id', 'name', 'email', 'role', 'created_at']),
        ], 201);
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => ['sometimes', 'required', 'string', 'max:255'],
            'email' => ['sometimes', 'required', 'email', 'max:255', 'unique:users,email,' . $user->id],
            'password' => ['nullable', 'string', 'min:8'],
            'role' => ['sometimes', 'required', 'in:admin,employee'],
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
        $user->delete();

        return response()->json([
            'message' => 'User deleted successfully.',
        ]);
    }
}