<?php 
namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class EnsureClientCanAccessAutoEnchere
{
    public function handle($request, Closure $next)
    {
        $client = Auth::guard('client')->user();

        // Si pas connecté ou type ≠ flotte&enchere → redirige vers login
        if (!$client || $client->type !== 'flotte&enchere') {
            // Optional: logout the client to prevent dashboard access
            Auth::guard('client')->logout();

            return redirect()
                ->route('client.login')
                ->with('flotte_enchere_blocked', 'Votre compte doit être de type Flotte & Enchère pour accéder aux enchères.');
        }

        return $next($request);
    }
}
