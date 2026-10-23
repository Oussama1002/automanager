<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Reprise;
use App\Models\Ville;
use Illuminate\Http\Request;

class RepriseController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index()
    {
        // Montre juste la page d’intro (pas besoin de données)
        return view('reprise.index');
    }

    public function form()
    {
        // Charge les données pour le formulaire
        $brands = Brand::all();
        $city = Ville::all();
        return view('reprise.reprise', compact('brands', 'city'));
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
        $reprise = $request->validate([
            'name' => ['required', 'string'],
            'city' => ['required', 'string'],
            'mark' => ['required', 'string'],
            'modele' => ['required', 'string'],
            'phone' => ['required', 'numeric'],
            'year' => ['required', 'string'],
            'email' => ['nullable', 'string'],
            'contacte' => ['required', 'string'],
            'rendezvous' => ['required', 'date'],

        ]);
        Reprise::create($reprise);

        return to_route('reprise.reprise')->with('success', 'Votre demande a ete envoyer');
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
    public function getModels(Request $request)
    {
        $brandId = $request->brand_id;

        $models = \App\Models\Modele::where('brand_id', $brandId)->get(['id', 'name']);

        return response()->json($models);
    }
}
