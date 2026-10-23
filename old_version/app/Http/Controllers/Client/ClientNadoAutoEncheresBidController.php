<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\NadoAutoEnchere;
use App\Models\NadoAutoEncheresBid;

use App\Models\Brand;
use App\Models\Modele;
use App\Models\Ville;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\BidsExport;
class ClientNadoAutoEncheresBidController extends Controller
{
  public function index()
{
    $client = Auth::guard('client')->user();

    $vehiculeIds = NadoAutoEnchere::where('phone', $client->phone)->pluck('id');

    $bids = NadoAutoEncheresBid::with(['enchere.brand', 'enchere.modeleRelation', 'enchere.client'])
        ->whereIn('enchere_id', $vehiculeIds)
        ->orderByDesc('created_at')
        ->get();

    $bidsGrouped = $bids->groupBy('enchere_id')->map(function ($enchereBids) {
        $enchere = $enchereBids->first()->enchere;
        return [
            'enchere' => $enchere,
            'ville' => $enchere->client->city ?? 'Pas de Ville',
            'entreprise' => $enchere->client->company ?? 'Pas Entreprise',
            'nombre_offres' => $enchereBids->count(),
            'meilleure_offre' => $enchereBids->max('proposition'),
            'vues' => $enchere->views ?? 0,
        ];
    });

    return view('client.nadoautoencheresbid.index', compact('bids', 'bidsGrouped'));
}


    public function destroy($id)
{
    $bid = NadoAutoEncheresBid::findOrFail($id);
    $bid->delete();

    return redirect()->route('client.nadoautoencheresbid.index')
                     ->with('success', 'Offre supprimée avec succès 🗑️');
}


public function show()
{
    $client = Auth::guard('client')->user();

    // Récupère toutes les offres FAITES par ce client
    $bids = NadoAutoEncheresBid::with(['enchere.brand', 'enchere.modeleRelation'])
        ->where('client_id', $client->id)
        ->orderByDesc('created_at')
        ->get();

    return view('client.nadoautoencheresbid.mybids', compact('bids'));
}
public function export()
{
    $client = Auth::guard('client')->user();

    // Get all bids for client's vehicles
    $bids = NadoAutoEncheresBid::whereHas('enchere', function($q) use ($client) {
            $q->where('phone', $client->phone);
        })
        ->with(['enchere.brand', 'enchere.modeleRelation', 'enchere.client'])
        ->get();

    $filename = 'mes_offres_' . date('Y-m-d_H-i-s') . '.csv';

    $headers = [
        "Content-Type" => "text/csv; charset=UTF-8",
        "Content-Disposition" => "attachment; filename=\"$filename\"",
    ];

    $callback = function() use ($bids) {
        $file = fopen('php://output', 'w');

        // UTF-8 BOM
        fprintf($file, chr(0xEF).chr(0xBB).chr(0xBF));

        // Single table header
        fputcsv($file, ['Véhicule', 'Matricule', 'Ville', 'Entreprise','Nombre D\'offres', 'Meilleure Offre (MAD)','Vues']);

        // Group bids by enchere_id
        $bidsGrouped = $bids->groupBy('enchere_id');

        foreach ($bidsGrouped as $enchereId => $groupedBids) {
            $enchere = $groupedBids->first()->enchere;

            fputcsv($file, [
                // Véhicule (Marque + Modèle)
                ($enchere->brand->name ?? 'Marque supprimée') . ' ' . ($enchere->modeleRelation->name ?? 'Modèle supprimé'),

                // Matricule
                $enchere->matricule ?? 'Matricule supprimé',

                // Ville
                $enchere->client->city ?? 'Pas de Ville',

                // Entreprise
                $enchere->client->company ?? 'Pas Entreprise',

                // Nombre d'offres
                $groupedBids->count(),

                // Meilleure offre
                number_format($groupedBids->max('proposition'), 2, ',', ' '),

                // Vues
                $enchere->views ?? 0,
            ]);
        }

        fclose($file);
    };

    return response()->stream($callback, 200, $headers);
}




}
