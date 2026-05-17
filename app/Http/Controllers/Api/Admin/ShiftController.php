<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Shift;
use Illuminate\Http\Request;

use App\Http\Resources\ShiftResource;

class ShiftController extends Controller
{
    public function index()
    {
        $shifts = Shift::query()
            ->with('user:id,name,email,role')
            ->orderBy('date')
            ->orderBy('start_time')
            ->get();

        return ShiftResource::collection($shifts);

    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => ['required', 'exists:users,id'],
            'date' => ['required', 'date'],
            'start_time' => ['required', 'date_format:H:i'],
            'end_time' => ['required', 'date_format:H:i', 'after:start_time'],

            'city' => ['required', 'string', 'max:100'],
            'position' => ['required', 'string', 'max:100'],
            'company' => ['required', 'string', 'max:100'],

            'schedule_status' => ['nullable', 'in:pending,confirmed'],
            'hours_approval_status' => ['nullable', 'in:pending,approved'],
        ]);

        $shift = Shift::create([
            ...$validated,
            'schedule_status' => $validated['schedule_status'] ?? 'pending',
            'hours_approval_status' => $validated['hours_approval_status'] ?? 'pending',
        ]);

        $shift->load('user:id,name,email,role');

        return response()->json([
            'message' => 'Shift created successfully.',
            'data' => new ShiftResource($shift),
        ], 201);
    }

    public function update(Request $request, Shift $shift)
    {
        $validated = $request->validate([
            'user_id' => ['sometimes', 'required', 'exists:users,id'],
            'date' => ['sometimes', 'required', 'date'],
            'start_time' => ['sometimes', 'required', 'date_format:H:i'],
            'end_time' => ['sometimes', 'required', 'date_format:H:i', 'after:start_time'],

            'city' => ['sometimes', 'required', 'string', 'max:100'],
            'position' => ['sometimes', 'required', 'string', 'max:100'],
            'company' => ['sometimes', 'required', 'string', 'max:100'],

            'schedule_status' => ['sometimes', 'required', 'in:pending,confirmed'],
            'hours_approval_status' => ['sometimes', 'required', 'in:pending,approved'],
        ]);

        $shift->update($validated);

        $shift->load('user:id,name,email,role');

        return response()->json([
            'message' => 'Shift updated successfully.',
            'data' => new ShiftResource($shift),
        ]);
    }

    public function destroy(Shift $shift)
    {
        $shift->delete();

        return response()->json([
            'message' => 'Shift deleted successfully.',
        ]);
    }

        public function confirm(Shift $shift)
    {
        $shift->update([
            'schedule_status' => 'confirmed',
        ]);

        $shift->load('user:id,name,email,role');

        return response()->json([
            'message' => 'Shift confirmed successfully.',
            'data' => new ShiftResource($shift),
        ]);
    }

    public function approveHours(Shift $shift)
    {
        $shift->update([
            'hours_approval_status' => 'approved',
        ]);

        $shift->load('user:id,name,email,role');

        return response()->json([
            'message' => 'Shift hours approved successfully.',
            'data' => new ShiftResource($shift),
        ]);

    }

}