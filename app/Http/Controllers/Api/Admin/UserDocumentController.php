<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\DocumentResource;
use App\Models\User;

class UserDocumentController extends Controller
{
    public function index(User $user) {
        
        $documents = $user->documents()
            ->latest()
            ->get();

        return DocumentResource::collection($documents);
    }
}
