<?php

namespace App\Http\Controllers;

use App\Models\Annonces;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
    public function index()
{
    $user = Auth::guard('client')->user();
    $favorites = $user->favorites()->latest()->get();

    return view('client.favorites', compact('favorites'));
}

    public function toggle($id)
    {
         $annonce = Annonces::findOrFail($id);
    $user = Auth::guard('client')->user();

    if ($user->favorites()->where('annonce_id', $id)->exists()) {
        $user->favorites()->detach($id);
        $message = 'Retiré des favoris ❌';
    } else {
        $user->favorites()->attach($id);
        $message = 'Ajouté aux favoris ✅';
    }

    return back()->with('success', $message);
    }
}
