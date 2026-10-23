<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureClientIsVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
{
    $user = Auth::guard('client')->user();

    if ($user && !$user->is_verified) {
        Auth::guard('client')->logout();
        return redirect()->route('client.login')->with('error', 'Votre compte est en attente de validation par l\'administrateur.');
    }

    return $next($request);
}

}
