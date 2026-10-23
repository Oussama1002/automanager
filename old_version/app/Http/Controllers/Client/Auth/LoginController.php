<?php
namespace App\Http\Controllers\Client\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm() {
        return view('client.auth.login');
    }
    protected function authenticated(Request $request, $user)
{
    if (!$user->is_approved) {
        Auth::guard('client')->logout();
        return redirect()->route('client.login')->withErrors(['Votre compte n\'est pas encore activé par l\'administrateur.']);
    }
}


public function login(Request $request) {
    $credentials = $request->only('email', 'password');

    if (Auth::guard('client')->attempt($credentials)) {
        $client = Auth::guard('client')->user();

        if (!$client->is_approved) {
            Auth::guard('client')->logout();
            return redirect()->route('client.login')->withErrors(['Votre compte n\'est pas encore activé par l\'administrateur.']);
        }

        return redirect()->intended(route('index'));
    }

    return back()->withErrors([
        'email' => 'Identifiants invalides.',
    ]);
}

    protected function guard()
{
    return Auth::guard('client');
}

    
}

