<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ShiftResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'userId' => $this->user_id,
            'date' => $this->date,
            'startTime' => substr($this->start_time, 0, 5),
            'endTime' => substr($this->end_time, 0, 5),
            'city' => $this->city,
            'position' => $this->position,
            'company' => $this->company,
            'scheduleStatus' => $this->schedule_status,
            'hoursApprovalStatus' => $this->hours_approval_status,

            'user' => $this->whenLoaded('user', function () {
                return [
                    'id' => $this->user->id,
                    'name' => $this->user->name,
                    'email' => $this->user->email,
                    'role' => $this->user->role,
                ];
            }),
        ];
    }
}