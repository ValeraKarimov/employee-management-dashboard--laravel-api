<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\LeaveRequest;

class LeaveRequestController extends Controller
{
    public function index()
    {
        $leaveRequests = LeaveRequest::query()
            ->with('user:id,name,email,role')
            ->latest()
            ->get();

        return response()->json([
            'data' => $leaveRequests,
        ]);
    }

    public function approve(LeaveRequest $leaveRequest)
    {
        $leaveRequest->update([
            'status' => 'approved',
        ]);

        return response()->json([
            'message' => 'Leave request approved successfully.',
            'data' => $leaveRequest,
        ]);
    }

    public function reject(LeaveRequest $leaveRequest)
    {
        $leaveRequest->update([
            'status' => 'rejected',
        ]);

        return response()->json([
            'message' => 'Leave request rejected successfully.',
            'data' => $leaveRequest,
        ]);
    }
}