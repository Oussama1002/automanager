<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Vente;
use App\Models\Ville;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class VenteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
     {
         // Montre juste la page d’intro (pas besoin de données)
         return view('vente.index');
     }
 
     public function form()
     {
         // Charge les données pour le formulaire
         $brands = Brand::all();
         $city = Ville::all();
 
         return view('vente.vente', compact('brands', 'city'));
     }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */

    public function store(Request $request)
    {
        // 1️⃣ Validate form fields
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:50',
            'city' => 'required|string|max:100',
            'mark' => 'required|string|max:100',
            'modele' => 'required|string|max:100',
            'year' => 'required|string|max:10',
            'km' => 'nullable|string|max:50',
            'carburant' => 'nullable|string|max:50',
            'box' => 'nullable|string|max:50',
            'etat' => 'nullable|string|max:50',
            'type' => 'nullable|string|max:50',
            'origine' => 'nullable|string|max:100',
            'jeveux' => 'required|string|max:100',
            'mode' => 'required|string|max:100',
            'rendezvous' => 'required|date',
            'img_avant' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'img_derriere' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'img_cartegrise' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        // 2️⃣ Create the vente
        $vente = new Vente($validated);

        // 3️⃣ Handle file uploads
        if ($request->hasFile('img_avant')) {
            $vente->img_avant = $request->file('img_avant')->store('ventes', 'public');
        }

        if ($request->hasFile('img_derriere')) {
            $vente->img_derriere = $request->file('img_derriere')->store('ventes', 'public');
        }

        if ($request->hasFile('img_cartegrise')) {
            $vente->img_cartegrise = $request->file('img_cartegrise')->store('ventes', 'public');
        }

        // 4️⃣ Save to DB
        $vente->save();

        // 5️⃣ Redirect with success message
        return redirect()->back()->with('success', 'Votre demande de vente a été enregistrée avec succès !');
    }



    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }
public function getModels(Request $request)
{
    $brandId = $request->brand_id;

    $models = \App\Models\Modele::where('brand_id', $brandId)->get(['id', 'name']);
    
    return response()->json($models);
}

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function resizeImage($photo, $title)
    {
        $image = $photo;
        $imageName = Str::slug($title, '-').'-'.rand(100000, 999999).'.'.$image->getClientOriginalExtension();
        $manager = new ImageManager(new Driver);
        $img = $manager->read($image);
        $img->save(storage_path('app/public/vente/'.$imageName));

        return $imageName;
    }
}
