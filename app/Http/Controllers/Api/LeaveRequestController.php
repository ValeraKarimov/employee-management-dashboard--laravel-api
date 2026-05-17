<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\LeaveRequest;

use App\Http\Resources\LeaveRequestResource;

class LeaveRequestController extends Controller
{
    public function index(Request $request)
    {
        $leaveRequests = $request->user()
            ->leaveRequests()
            ->latest()
            ->get();

        // return response()->json([
        //     'data' => $leaveRequests,
        // ]);

        return LeaveRequestResource::collection($leaveRequests);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'start_date' => ['required', 'date', 'after_or_equal:today'],
            'end_date' => ['required', 'date', 'after_or_equal:start_date'],
            'reason' => ['nullable', 'string', 'max:1000'],
        ]);

        $leaveRequest = $request->user()->leaveRequests()->create([
            ...$validated,
            'status' => 'pending',
        ]);

        // return response()->json([
        //     'message' => 'Leave request created successfully.',
        //     'data' => $leaveRequest,
        // ], 201);

        return response()->json([
            'message' => 'Leave request created successfully.',
            'data' => new LeaveRequestResource($leaveRequest),
        ], 201);
    }
}
