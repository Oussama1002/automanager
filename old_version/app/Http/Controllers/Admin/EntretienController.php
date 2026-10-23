<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Entretien;
use App\Models\Annonces;
use Illuminate\Http\Request;

class EntretienController extends Controller
{
    public function index()
{
    $entretiens = \App\Models\Entretien::latest()->get();
    return view('admin.entretiens.index', compact('entretiens'));
}

    public function create($annonce_id)
    {
        $annonces = Annonces::all(); // Fetch all annonces to choose from
        return view('admin.entretiens.create', compact('annonces'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'annonce_id' => 'required|exists:annonces,id',
            'date' => 'nullable|date',
            'revision' => 'nullable|string',
            'entretien' => 'nullable|string',
            'reparation' => 'nullable|string',
            'carrosserie' => 'nullable|string',
            'professionnels' => 'nullable|string',
        ]);

        Entretien::create($request->all());

        return redirect()->back()->with('success', 'Entretien ajouté avec succès.');
    }
    public function edit(Entretien $entretien)
    {
        $annonces = Annonces::orderBy('id', 'desc')->get();
        return view('admin.entretiens.edit', compact('entretien', 'annonces'));
    }

    // Update the entretien
    public function update(Request $request, Entretien $entretien)
    {
        $validated = $request->validate([
            'annonce_id'    => 'required|exists:annonces,id',
            'date'          => 'nullable|date',
            'revision'      => 'nullable|string|max:255',
            'entretien'     => 'nullable|string|max:255',
            'reparation'    => 'nullable|string|max:255',
            'carrosserie'   => 'nullable|string|max:255',
            'professionnels'=> 'nullable|string|max:255',
        ]);

        $entretien->update($validated);

        return redirect()->route('admin.entretiens.index')
                         ->with('success', "L'entretien a été mis à jour avec succès !");
    }
}
