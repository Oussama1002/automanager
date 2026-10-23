<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{

    public function dashboard()
{
    $user = auth()->user();
    $annonces = $user->annonces; // Assuming relationship exists
    $favorites = $user->favorites; // Assuming pivot relation
    return view('client.dashboard', compact('user', 'annonces', 'favorites'));
}
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('client.profile.edit', [
            'user' => $request->user(),
        ]);
    }
    

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
{
    $user = $request->user();

    $user->fill($request->validated());

    // ✅ Upload logo si présent
    if ($request->hasFile('logo')) {
        $filename = $user->id . '-' . rand(100000,999999) . '.' . $request->logo->getClientOriginalExtension();
        $request->logo->storeAs('public/nadoautoenchere/logo', $filename);

        $user->logo = $filename;
    }

    // ✅ Gérer company seulement si flotte&enchere ou pro
    if (in_array($user->account_type, ['flotte&enchere', 'pro'])) {
        $user->company = $request->input('company');
    }

    if ($user->isDirty('email')) {
        $user->email_verified_at = null;
    }

    $user->save();

    return Redirect::route('client.profile.edit')
        ->with('status', 'profile-updated');
}

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
}
