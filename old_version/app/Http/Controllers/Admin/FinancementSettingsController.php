<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FinancementSetting;
use App\Models\ClientType;

class FinancementSettingsController extends Controller
{
    public function index()
    {
        // Global financing settings
        $settings = [
            'frais_dossier' => FinancementSetting::getValue('frais_dossier', '4375'),
            'assurance_annuelle' => FinancementSetting::getValue('assurance_annuelle', '235'),
            'taux_interet_default' => FinancementSetting::getValue('taux_interet_default', '13'),
        ];

        // All client types
        $clientTypes = ClientType::all();

        return view('admin.financementSettings.index', compact('settings', 'clientTypes'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'frais_dossier' => 'required|numeric|min:0',
            'assurance_annuelle' => 'required|numeric|min:0',
            'taux_interet_default' => 'required|numeric|min:0|max:100',
            'client_types.*.name' => 'nullable|string|max:255',
            'client_types.*.taux_interet' => 'nullable|numeric|min:0|max:100',
            'new_client_type_name' => 'nullable|string|max:255',
            'new_client_type_taux' => 'nullable|numeric|min:0|max:100',
        ]);
    
        // Update global settings
        FinancementSetting::setValue('frais_dossier', $request->frais_dossier);
        FinancementSetting::setValue('assurance_annuelle', $request->assurance_annuelle);
        FinancementSetting::setValue('taux_interet_default', $request->taux_interet_default);
    
        // Update existing client types
        if ($request->client_types) {
            foreach ($request->client_types as $id => $data) {
                if (!empty($data['delete']) && $data['delete'] == '1') {
                    ClientType::destroy($id);
                } else {
                    ClientType::where('id', $id)->update([
                        'name' => $data['name'],
                        'taux_interet' => $data['taux_interet'],
                    ]);
                }
            }
        }
    
        // Add new client type
        if ($request->filled('new_client_type_name') && $request->filled('new_client_type_taux')) {
            ClientType::create([
                'name' => $request->new_client_type_name,
                'taux_interet' => $request->new_client_type_taux,
            ]);
        }
    
        return redirect()->back()->with('success', 'Paramètres de financement mis à jour avec succès.');
    }
    
}
