<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Accessoire;
use Illuminate\Support\Facades\Storage;

class AccessoiresController extends Controller
{
    public function index()
    {
        $accessoires = Accessoire::latest()->get();
        return view('admin.accessoires.index', compact('accessoires'));
    }

    public function create()
    {
        return view('admin.accessoires.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'titre' => 'required|string|max:255',
            'prix' => 'nullable|numeric',
            'description' => 'nullable|string',
            'status' => 'required|boolean',
            'images.*' => 'image|mimes:jpg,jpeg,png,webp|max:2048'
        ]);

        $accessoire = new Accessoire();
        $accessoire->titre = $request->titre;
        $accessoire->prix = $request->prix;
        $accessoire->description = $request->description;
        $accessoire->status = $request->status;

        if ($request->hasFile('images')) {
            $images = [];
            foreach ($request->file('images') as $image) {
                $path = $image->store('accessoires', 'public');
                $images[] = $path;
            }
            $accessoire->images = $images;
        }

        $accessoire->save();

        return redirect()->route('admin.accessoires.index')->with('success', 'Accessoire ajouté avec succès.');
    }
}
