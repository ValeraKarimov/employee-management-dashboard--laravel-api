<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\DocumentResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller
{
    public function index(Request $request)
    {
        $documents = $request->user()
            ->documents()
            ->latest()
            ->get();

        return DocumentResource::collection($documents);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'file' => [
                'required',
                'file',
                'max:5120',
                'mimes:pdf,doc,docx,png,jpg,jpeg',
            ],
        ]);

        $file = $validated['file'];

        $path = $file->store('documents', 'public');

        $document = $request->user()->documents()->create([
            'name' => $validated['name'],
            'file_path' => $path,
            'original_name' => $file->getClientOriginalName(),
            'mime_type' => $file->getMimeType(),
            'size' => $file->getSize(),
        ]);

        return response()->json([
            'message' => 'Document uploaded successfully.',
            'data' => new DocumentResource($document),
        ], 201);
    }

    public function destroy(Request $request, int $documentId)
    {
        $document = $request->user()
            ->documents()
            ->findOrFail($documentId);

        Storage::disk('public')->delete($document->file_path);

        $document->delete();

        return response()->json([
            'message' => 'Document deleted successfully.',
        ]);
    }
}