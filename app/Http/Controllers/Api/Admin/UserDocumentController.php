<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\DocumentResource;
use App\Models\User;
use App\Models\Document;
use Illuminate\Http\Request;


class UserDocumentController extends Controller
{
    public function index(User $user) {
        
        $documents = $user->documents()
            ->latest()
            ->get();

        return DocumentResource::collection($documents);
    }

    public function all(Request $request)
{
    $query = Document::query()
        ->with('user')
        ->latest();

    if ($request->filled('search')) {
        $search = $request->string('search');

        $query->where(function ($q) use ($search) {
            $q->where('name', 'like', "%{$search}%")
              ->orWhere('original_name', 'like', "%{$search}%");
        });
    }

    if ($request->filled('user_id')) {
        $query->where('user_id', $request->integer('user_id'));
    }

    return DocumentResource::collection(
        $query->paginate(20)
    );
}

}
