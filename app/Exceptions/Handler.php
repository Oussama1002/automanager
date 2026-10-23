<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Session\TokenMismatchException;
use Illuminate\Support\Facades\Auth;
use Throwable;

class Handler extends ExceptionHandler
{
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        // Redirect instead of showing the raw 419 page when CSRF token expires.
        $this->renderable(function (TokenMismatchException $e, $request) {
            // If the expired request came from the logout action, just redirect to
            // the home / login page — the user is effectively already signed out.
            if ($request->is('*/logout') || $request->is('logout')) {
                Auth::guard('client')->logout();
                $request->session()->flush();
                return redirect()->route('index');
            }

            return redirect()->back()
                ->withInput($request->except(['_token', 'password', 'password_confirmation']))
                ->withErrors(['session' => 'Votre session a expiré. Veuillez réessayer.']);
        });
    }
}
