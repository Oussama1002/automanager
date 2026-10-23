<?php

namespace App\Http\Controllers\Client\Auth;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Services\WhatsAppService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VerifyWhatsAppController extends Controller
{
    public function show(Request $request)
    {
        // If no pending client in session, redirect to register
        if (!$request->session()->has('pending_client_id')) {
            return redirect()->route('client.register');
        }

        return view('client.auth.verify-whatsapp');
    }

    public function verify(Request $request)
    {
        $request->validate([
            'otp' => 'required|string|size:6|regex:/^[0-9]{6}$/',
        ]);

        $clientId = $request->session()->get('pending_client_id');
        if (!$clientId) {
            return redirect()->route('client.register')
                ->withErrors(['Votre session a expiré. Veuillez vous réinscrire.']);
        }

        $client = Client::find($clientId);
        if (!$client) {
            return redirect()->route('client.register')
                ->withErrors(['Compte introuvable. Veuillez vous réinscrire.']);
        }

        // Check OTP expiry
        if (!$client->otp_expires_at || now()->isAfter($client->otp_expires_at)) {
            return back()->withErrors(['otp' => 'Le code a expiré. Veuillez en demander un nouveau.']);
        }

        // Check OTP match
        if ($request->otp !== $client->otp_code) {
            return back()->withErrors(['otp' => 'Code incorrect. Vérifiez votre WhatsApp.']);
        }

        // Approve and clear OTP
        $client->update([
            'is_approved' => true,
            'is_verified' => true,
            'otp_code'    => null,
            'otp_expires_at' => null,
        ]);

        $request->session()->forget('pending_client_id');

        // Log the client in
        Auth::guard('client')->login($client);

        return redirect()->route('index')
            ->with('success', 'Bienvenue sur NADO ! Votre compte est maintenant activé.');
    }

    public function resend(Request $request)
    {
        $clientId = $request->session()->get('pending_client_id');
        if (!$clientId) {
            return redirect()->route('client.register');
        }

        $client = Client::find($clientId);
        if (!$client) {
            return redirect()->route('client.register');
        }

        $otp = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
        $client->update([
            'otp_code'       => $otp,
            'otp_expires_at' => now()->addMinutes(10),
        ]);

        $whatsapp = app(WhatsAppService::class);
        $sent     = $whatsapp->sendOtp($client->phone, $otp);

        if (!$sent) {
            return back()->with('otp_warning', 'Envoi WhatsApp échoué. Code de secours : ' . $otp);
        }

        return back()->with('otp_resent', 'Nouveau code envoyé sur WhatsApp.');
    }
}
