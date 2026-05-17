<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\ShiftResource;

class ShiftController extends Controller
{
    public function index(Request $request)
    {
        $shifts = $request->user()
            ->shifts()
            ->orderBy('date')
            ->orderBy('start_time')
            ->get();

            return ShiftResource::collection($shifts);
    }
}   
