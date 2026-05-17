<?php

use App\Http\Controllers\Api\Admin\UserController;
use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\Admin\UserProfileController;

use App\Http\Controllers\Api\LeaveRequestController;
use App\Http\Controllers\Api\Admin\LeaveRequestController as AdminLeaveRequestController;

use App\Http\Controllers\Api\ShiftController;
use App\Http\Controllers\Api\Admin\ShiftController as AdminShiftController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/health', function() {
    return response()->json([
        'status' => 'ok',
        'app' => config('app.name'),
        'database' => 'connected',
    ]);
});

Route::post('/login', [AuthController::class, 'login']);

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me', [AuthController::class, 'me']);
    Route::post('/logout', [AuthController::class, 'logout']);

    Route::get('/profile', [ProfileController::class, 'show']);
    Route::put('/profile', [ProfileController::class, 'update']);

    Route::get('/leave-requests', [LeaveRequestController::class, 'index']);
    Route::post('/leave-requests', [LeaveRequestController::class, 'store']);

    Route::get('/shifts', [ShiftController::class, 'index']);

    Route::middleware('role:admin')->group(function() {
        Route::get('/admin/test', function () {
            return response()->json([
                'message' => 'Admin access granted.',
            ]);
        });
    });


// ADMIN GROUP
    Route::middleware(['auth:sanctum', 'role:admin'])->prefix('admin')->group(function () {
        Route::apiResource('users', UserController::class);

        Route::get('/users/{user}/profile', [UserProfileController::class, 'show']);
        Route::put('/users/{user}/profile', [UserProfileController::class, 'update']);

        Route::get('/leave-requests', [AdminLeaveRequestController::class, 'index']);
        Route::patch('/leave-requests/{leaveRequest}/approve', [AdminLeaveRequestController::class, 'approve']);
        Route::patch('/leave-requests/{leaveRequest}/reject', [AdminLeaveRequestController::class, 'reject']);
        
        Route::patch('/shifts/{shift}/confirm', [AdminShiftController::class, 'confirm']);
        Route::patch('/shifts/{shift}/approve-hours', [AdminShiftController::class, 'approveHours']);
        
        Route::apiResource('shifts', AdminShiftController::class)
            ->except(['show']);
    });

});

// Route::middleware(['auth:sanctum', 'role:admin'])->get('/admin/test', function () {
//     return response()->json([
//         'message' => 'Admin access granted.',
//     ]);
// });