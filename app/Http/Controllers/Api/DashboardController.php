<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Document;
use App\Models\LeaveRequest;
use App\Models\Shift;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();

        if ($user->role === 'admin') {
            return response()->json([
                'data' => [
                    'usersCount' => User::count(),
                    'pendingLeaveRequestsCount' => LeaveRequest::where('status', 'pending')->count(),
                    'shiftsCount' => Shift::count(),
                    'documentsCount' => Document::count(),
                ],
            ]);
        }

        return response()->json([
            'data' => [
                'myShiftsCount' => $user->shifts()->count(),
                'myLeaveRequestsCount' => $user->leaveRequests()->count(),
                'myDocumentsCount' => $user->documents()->count(),
                'pendingLeaveRequestsCount' => $user->leaveRequests()
                    ->where('status', 'pending')
                    ->count(),
            ],
        ]);
    }
}