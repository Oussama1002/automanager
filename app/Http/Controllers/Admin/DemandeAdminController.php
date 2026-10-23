<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Demande;
use Illuminate\Http\Request;

class DemandeAdminController extends Controller
{
    public function index(Request $request)
    {
        $q = Demande::with(['brand', 'modele', 'ville', 'replies' => function ($r) {
            $r->where('status', 'visible')->latest();
        }])->latest();
        if ($status = $request->get('status')) $q->where('status', $status);
        return view('admin.demandes.index', [
            'demandes' => $q->paginate(20)->withQueryString(),
            'status'   => $status,
        ]);
    }

    public function pending()
    {
        $demandes = Demande::where('status', 'pending')
            ->with(['brand', 'modele', 'ville'])
            ->latest()
            ->paginate(20);

        return view('admin.demandes.pending', compact('demandes'));
    }

    public function approve(Demande $demande)
    {
        $demande->update([
            'status'     => 'approved',
            'expires_at' => $demande->expires_at ?? now()->addDays(30),
        ]);
        return back()->with('success', 'Demande approuvée.');
    }

    public function reject(Demande $demande)
    {
        $demande->update(['status' => 'rejected']);
        return back()->with('success', 'Demande rejetée.');
    }

    public function destroy(Demande $demande)
    {
        $demande->delete();
        return back()->with('success', 'Demande supprimée.');
    }
}
