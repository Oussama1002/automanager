<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Imgslider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class ImgSlideController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.imgslider.index', ['imgslider' => Imgslider::all()]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.imgslider.form', ['imgslider' => new Imgslider]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $imgslider = $request->validate([
            'name' => ['required', 'string'],
            'link' => ['required', 'string'],
            'type' => ['nullable'],
            'active' => ['nullable', 'string'],
            'image' => ['required', 'image', 'mimes:jpeg,png,jpg,gif', 'max:5120'],
        ]);
        if ($request->hasFile('image')) {
            $imgslider['image'] = $this->resizeImage($request->file('image'), $request->name);
        }
        Imgslider::create($imgslider);
        Cache::forget('Imgslider');

        return to_route('admin.imgslider.index')->with('success', 'Success store Image slider');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Imgslider $imgslider)
    {
        return view('admin.imgslider.form', [
            'imgslider' => $imgslider,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Imgslider $imgslider)
    {
        $n = $request->validate([
            'name' => ['required', 'string'],
            'link' => ['required', 'string'],
            'active' => ['nullable', 'string'],
            'type' => ['nullable'],
            'image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:5120'],
        ]);
        if ($request->hasFile('image')) {
            $n['image'] = $this->resizeImage($request->file('image'), $request->name);
        }

        if (! $request->has('active')) {
            $n['active'] = 0;
        }
        $imgslider->update($n);
        Cache::forget('Imgslider');

        return to_route('admin.imgslider.index')->with('success', 'success update Image slider');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Imgslider $imgslider)
    {
        $imgslider->delete();

        return to_route('imgslider.index')->with('success', 'Image slider deleted successfully');
    }

    public function resizeImage($photo, $title)
    {
        $image = $photo;
        $imageName = Str::slug($title, '-').'-'.time().'.'.$image->getClientOriginalExtension();
        $manager = new ImageManager(new Driver);
        $img = $manager->read($image);
        $img->save(storage_path('app/public/imgslider/'.$imageName));

        return $imageName;
    }
}
