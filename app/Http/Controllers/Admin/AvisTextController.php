<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Avistext;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class AvisTextController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.avistext.index', ['avistext' => Avistext::all()]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.avistext.form', ['avistext' => new Avistext]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $avistext = $request->validate([
            'name' => ['required', 'string'],
            'job' => ['required', 'string'],
            'text' => ['required', 'string'],
            'image' => ['required', 'image', 'mimes:jpeg,png,jpg,gif', 'max:5120'],
        ]);
        if ($request->hasFile('image')) {
            $avistext['image'] = $this->resizeImage($request->file('image'), 'nado');
        }
        Avistext::create($avistext);
        Cache::forget('avistext');

        return to_route('avistext.index')->with('success', 'Success store avis text');
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
    public function edit(Avistext $avistext)
    {
        return view('admin.avistext.form', [
            'avistext' => $avistext,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Avistext $avistext)
    {
        $n = $request->validate([
            'name' => ['required', 'string'],
            'job' => ['required', 'string'],
            'text' => ['required', 'string'],
            'image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:5120'],
        ]);
        if ($request->hasFile('image')) {
            $n['image'] = $this->resizeImage($request->file('image'), 'nado');
        }
        $avistext->update($n);
        Cache::forget('avistext');

        return to_route('avistext.index')->with('success', 'success update Avis text');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Avistext $avistext)
    {
        $avistext->delete();

        return to_route('avistext.index')->with('success', 'Avis text deleted successfully');
    }

    public function resizeImage($photo, $title)
    {
        $image = $photo;
        $imageName = Str::slug($title, '-').'-'.time().'.'.$image->getClientOriginalExtension();
        $manager = new ImageManager(new Driver);
        $img = $manager->read($image);
        $img->save(storage_path('app/public/avistext/'.$imageName));

        return $imageName;
    }
}
