<?php

namespace App\Http\Controllers;

use App\Models\Annonce;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SellController extends Controller
{
    public function index()
    {
        $annonces = Auth::user()->annonces;
        return view('client.annonces.index', compact('annonces'));
    }

    public function create()
    {
        return view('client.annonces.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'titre' => 'required|string|max:255',
            'description' => 'nullable|string',
            'prix' => 'required|numeric',
        ]);

        Auth::user()->annonces()->create($request->only('titre', 'description', 'prix'));

        return redirect()->route('annonce.index')->with('success', 'Annonce créée avec succès.');
    }

    public function edit($id)
    {
        $annonce = Annonce::where('id', $id)->where('user_id', Auth::id())->firstOrFail();
        return view('client.annonces.edit', compact('annonce'));
    }

    public function update(Request $request, $id)
    {
        $annonce = Annonce::where('id', $id)->where('user_id', Auth::id())->firstOrFail();

        $request->validate([
            'titre' => 'required|string|max:255',
            'description' => 'nullable|string',
            'prix' => 'required|numeric',
        ]);

        $annonce->update($request->only('titre', 'description', 'prix'));

        return redirect()->route('annonce.index')->with('success', 'Annonce mise à jour.');
    }

    public function destroy($id)
    {
        $annonce = Annonce::where('id', $id)->where('user_id', Auth::id())->firstOrFail();
        $annonce->delete();

        return redirect()->route('annonce.index')->with('success', 'Annonce supprimée.');
    }
}

