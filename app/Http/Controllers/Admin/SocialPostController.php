<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SocialPost;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SocialPostController extends Controller
{
    public function index()
    {
        $posts = SocialPost::orderBy('position')->orderByDesc('created_at')->get();
        return view('admin.social-posts.index', compact('posts'));
    }

    public function create()
    {
        return view('admin.social-posts.form', ['post' => new SocialPost()]);
    }

    public function store(Request $request)
    {
        $data = $this->validated($request);

        if ($request->hasFile('thumbnail')) {
            $data['thumbnail'] = $request->file('thumbnail')->store('social-posts', 'public');
        }

        $data['is_active'] = $request->boolean('is_active', true);
        $data['position']  = (int) ($data['position'] ?? (SocialPost::max('position') + 1));

        SocialPost::create($data);

        return redirect()
            ->route('admin.social-posts.index')
            ->with('success', 'Publication sociale ajoutée avec succès.');
    }

    public function edit(SocialPost $socialPost)
    {
        return view('admin.social-posts.form', ['post' => $socialPost]);
    }

    public function update(Request $request, SocialPost $socialPost)
    {
        $data = $this->validated($request);

        if ($request->hasFile('thumbnail')) {
            if ($socialPost->thumbnail && Storage::disk('public')->exists($socialPost->thumbnail)) {
                Storage::disk('public')->delete($socialPost->thumbnail);
            }
            $data['thumbnail'] = $request->file('thumbnail')->store('social-posts', 'public');
        }

        $data['is_active'] = $request->boolean('is_active', false);

        $socialPost->update($data);

        return redirect()
            ->route('admin.social-posts.index')
            ->with('success', 'Publication sociale mise à jour.');
    }

    public function destroy(SocialPost $socialPost)
    {
        if ($socialPost->thumbnail && Storage::disk('public')->exists($socialPost->thumbnail)) {
            Storage::disk('public')->delete($socialPost->thumbnail);
        }
        $socialPost->delete();

        return redirect()
            ->route('admin.social-posts.index')
            ->with('success', 'Publication sociale supprimée.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'platform'  => 'required|in:tiktok,instagram',
            'url'       => 'required|url|max:500',
            'title'     => 'required|string|max:255',
            'handle'    => 'nullable|string|max:100',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,webp,gif|max:4096',
            'position'  => 'nullable|integer|min:0',
            'is_active' => 'nullable|boolean',
        ]);
    }
}
