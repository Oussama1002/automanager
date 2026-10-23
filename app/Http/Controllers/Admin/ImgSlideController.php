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
            'name' => ['nullable', 'string'],
            'link' => ['nullable', 'string'],
            'type' => ['nullable'],
            'active' => ['nullable', 'string'],
            'image' => ['required', 'image', 'mimes:jpeg,png,jpg,webp', 'max:5120', 'dimensions:min_width=1200,min_height=500'],
        ], $this->imageMessages());
        if ($request->hasFile('image')) {
            $imgslider['image'] = $this->resizeImage($request->file('image'), $request->name ?: 'slider');
        }
        $imgslider['active'] = $request->has('active') ? 1 : 0;
        // name/link are optional now, but the columns are NOT NULL in the database:
        // store empty strings rather than null.
        $imgslider['name'] = $imgslider['name'] ?? '';
        $imgslider['link'] = $imgslider['link'] ?? '';
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
            'name' => ['nullable', 'string'],
            'link' => ['nullable', 'string'],
            'active' => ['nullable', 'string'],
            'type' => ['nullable'],
            'image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,webp', 'max:5120', 'dimensions:min_width=1200,min_height=500'],
        ], $this->imageMessages());
        if ($request->hasFile('image')) {
            $n['image'] = $this->resizeImage($request->file('image'), $request->name ?: 'slider');
        }

        if (! $request->has('active')) {
            $n['active'] = 0;
        }
        // Same NOT NULL guard as store().
        $n['name'] = $n['name'] ?? '';
        $n['link'] = $n['link'] ?? '';
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
        Cache::forget('Imgslider'); // the front-page hero reads this cache

        return to_route('admin.imgslider.index')->with('success', 'Image slider deleted successfully');
    }

    /** Error messages shown in the admin form when the hero image is not suitable. */
    private function imageMessages(): array
    {
        return [
            'image.dimensions' => "L'image est trop petite : minimum 1200 × 500 px. Taille recommandée : 1920 × 1080 px (format paysage 16:9).",
            'image.max'        => "L'image est trop lourde : 5 Mo maximum. Compressez-la (ex. tinypng.com) en gardant 1920 px de large.",
            'image.mimes'      => "Format accepté : JPG, PNG ou WEBP.",
        ];
    }

    public function resizeImage($photo, $title)
    {
        $image = $photo;
        $imageName = Str::slug($title, '-').'-'.time().'.'.$image->getClientOriginalExtension();
        $manager = new ImageManager(new Driver);
        $img = $manager->read($image);
        // Shown full-width in the front-page hero: 1920 px wide is enough, larger files only slow the page
        $img->scaleDown(width: 1920);
        $img->save(storage_path('app/public/imgslider/'.$imageName));

        return $imageName;
    }
}
