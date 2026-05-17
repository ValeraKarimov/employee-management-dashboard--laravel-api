<?php

use App\Http\Controllers\Api\Admin\UserController;
use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

    Route::middleware('role:admin')->group(function() {
        Route::get('/admin/test', function () {
            return response()->json([
                'message' => 'Admin access granted.',
            ]);
        });
    });

    Route::middleware(['auth:sanctum', 'role:admin'])->prefix('admin')->group(function () {
        Route::apiResource('users', UserController::class);
    });

});

// Route::middleware(['auth:sanctum', 'role:admin'])->get('/admin/test', function () {
//     return response()->json([
//         'message' => 'Admin access granted.',
//     ]);
// });