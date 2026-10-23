<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
protected function redirectTo($request)
{
    if (! $request->expectsJson()) {
        if ($request->is('admin') || $request->is('admin/*')) {
            return route('admin.login'); // ⬅️ go to admin login
        }
        if ($request->is('client') || $request->is('client/*')) {
            return route('client.login'); // ⬅️ go to client login
        }
        return route('client.login'); // fallback
    }
}

}
