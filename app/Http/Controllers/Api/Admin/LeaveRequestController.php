<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\LeaveRequest;
use App\Http\Resources\LeaveRequestResource;

class LeaveRequestController extends Controller
{
    public function index()
    {
        $leaveRequests = LeaveRequest::query()
            ->with('user:id,name,email,role')
            ->latest()
            ->get();

        return LeaveRequestResource::collection($leaveRequests);
    }

    public function approve(LeaveRequest $leaveRequest)
    {
        $leaveRequest->update([
            'status' => 'approved',
        ]);

        $leaveRequest->load('user:id,name,email,role');

        return response()->json([
            'message' => 'Leave request approved successfully.',
            'data' => new LeaveRequestResource($leaveRequest),
        ]);
    }

    public function reject(LeaveRequest $leaveRequest)
    {
        $leaveRequest->update([
            'status' => 'rejected',
        ]);

        $leaveRequest->load('user:id,name,email,role');

        return response()->json([
            'message' => 'Leave request rejected successfully.',
            'data' => new LeaveRequestResource($leaveRequest),
        ]);
    }
}