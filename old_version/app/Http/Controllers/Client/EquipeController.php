<?php

namespace App\Http\Controllers\Client;
use Illuminate\Support\Facades\Notification;
use App\Notifications\AdminNotification;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Client;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class EquipeController extends Controller
{
    public function index()
    {
        $client = Auth::guard('client')->user();

        // Récupère l’équipe du client (même téléphone)
        $equipe = Client::where('phone', $client->phone)
                        ->where('id', '!=', $client->id) // exclure le client principal
                        ->get();

        return view('client.equipe.index', compact('equipe'));
    }

    public function create()
    {
        return view('client.equipe.create');
    }

    public function store(Request $request)
    {
        $request->validate([
    'name' => 'required|string|max:255',

            'email' => 'required|email|unique:clients,email',
            'password' => 'required|min:6',
        ]);

        $client = Auth::guard('client')->user();

        // Créer un membre de l’équipe
        Client::create([
    'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'type' => 'flotte&enchere',
        'phone' => $client->phone, // même numéro que le client principal
                'company' => $client->company, // même numéro que le client principal
        'logo' => $client->logo, // même numéro que le client principal


        'parent_id' => $client->id, // relie le membre au client principal            
        ]);
  Notification::route('mail', 'oussamaelhadi11@gmail.com')
            ->notify(new AdminNotification(
                "Nouveau membre dans l'equipe ({$client->name}) à approuver",
                "({$client->name}) vient d'ajouter un membre et attend votre approbation."
            ));
        return redirect()->route('client.equipe.index')->with('success', 'Membre ajouté avec succès !');
    }

    public function destroy($id)
    {
        $client = Auth::guard('client')->user();

        $member = Client::where('id', $id)
                        ->where('phone', $client->phone) // sécurité : que son équipe
                        ->firstOrFail();

        $member->delete();

        return redirect()->route('client.equipe.index')->with('success', 'Membre supprimé avec succès !');
    }
}
