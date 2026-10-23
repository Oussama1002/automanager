<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Story;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class StoriesController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin');
    }

    /* =======================
     * LIST STORIES
     * ======================= */
    public function index()
    {
        $stories = Story::latest()->get();
        return view('admin.stories.index', compact('stories'));
    }

    /* =======================
     * CREATE FORM
     * ======================= */
    public function create()
    {
        return view('admin.stories.create');
    }

    /* =======================
     * STORE STORY
     * ======================= */
    public function store(Request $request)
    {
        $data = $request->validate([
            'media' => 'required|file|mimes:jpeg,png,jpg,gif|max:20480',
            'expires_at' => 'nullable|date',
        ]);

        if ($request->hasFile('media')) {
            $data['media_path'] = $this->saveImage(
                $request->file('media'),
                'story'
            );
        }

        $data['media_type'] = 'image';
        $data['user_id'] = Auth::id();
        $data['views'] = 0;
        $data['expires_at'] = $request->expires_at ?? now()->addHours(24);

        Story::create($data);

        Cache::forget('stories');

        return redirect()
            ->route('admin.stories.index')
            ->with('success', 'Story created successfully');
    }

    /* =======================
     * DELETE STORY
     * ======================= */
    public function destroy($id)
    {
        $story = Story::findOrFail($id);

        // Delete media file
        if ($story->media_path && Storage::disk('public')->exists($story->media_path)) {
            Storage::disk('public')->delete($story->media_path);
        }

        $story->delete();

        Cache::forget('stories');

        return redirect()
            ->route('admin.stories.index')
            ->with('success', 'Story deleted successfully');
    }

    /* =======================
     * IMAGE SAVE & RESIZE
     * ======================= */
    private function saveImage($file, $prefix)
    {
        // 1. Generate your custom filename
        $filename = Str::slug($prefix) . '-' . time() . '.' . $file->getClientOriginalExtension();

        // 2. Save directly to the 'public' disk (which we fixed in config)
        // usage: storeAs(folder, filename, disk)
        $file->storeAs('stories', $filename, 'public');

        // 3. Return path for database
        return 'stories/' . $filename;
    }
}
