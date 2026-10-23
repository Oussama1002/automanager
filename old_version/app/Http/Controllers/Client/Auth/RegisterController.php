<?php

namespace App\Http\Controllers\Client\Auth;

use App\Http\Controllers\Controller;
use App\Models\Client;
use Illuminate\Support\Facades\Notification;
use App\Notifications\AdminNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function showRegistrationForm()
    {
        return view('client.auth.register');
    }

    public function register(Request $request)
    {
        // Validation
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:clients,email',
            'password' => 'required|string|min:6|confirmed',
            'type' => 'required|in:pro,particulier,flotte&enchere',
            'phone' => 'required|string|max:20',
             'company' => 'nullable|string|max:255',
        'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
// Upload logo si fourni
    $logoPath = null;
    if ($request->hasFile('logo')) {
        $filename = time() . '-' . uniqid() . '.' . $request->logo->getClientOriginalExtension();
        $request->logo->storeAs('public/nadoautoenchere/logo', $filename);
        $logoPath = json_encode([$filename]); // ["fichier.png"]
    }

        // Création du client avec is_approved = false
        $client = Client::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
            'type'     => $request->type,
            'phone'    => $request->phone,
            'company'  => $request->company,
        'logo'     => $logoPath,
            'is_approved' => false,
        ]);

        // Notification envoyée APRES la création du client
        // Notification::route('mail', 'oussamaelhadi11@gmail.com')
        //     ->notify(new AdminNotification(
        //         'Nouveau client à approuver',
        //         "Un nouveau client ({$client->name}) vient de s'inscrire et attend votre approbation."
        //     ));

        // Redirection
        return redirect()->route('client.login')
            ->with('success', 'Votre compte a été créé avec succès. Il est en attente de validation par l\'administrateur.');
    }
}
