<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DocumentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'userId' => $this->user_id,
            'name' => $this->name,
            'filePath' => $this->file_path,
            'filename' => $this->original_name,
            'mimeType' => $this->mime_type,
            'size' => $this->size,
            'uploadedAt' => $this->created_at?->toDateString(),
        ];

    }
}
