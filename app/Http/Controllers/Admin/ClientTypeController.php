<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ClientType;
use Illuminate\Http\Request;

class ClientTypeController extends Controller
{
    public function index()
    {
        $clientTypes = ClientType::all();
        return view('admin.financementSettings.client_types.index', compact('clientTypes'));
    }

    public function create()
    {
        return view('admin.financementSettings.client_types.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:client_types,name',
            'taux_interet' => 'required|numeric|min:0',
        ]);

        ClientType::create($request->only('name', 'taux_interet'));

        return redirect()->route('admin.client-types.index')->with('success', 'Type de client ajouté.');
    }

    public function edit(ClientType $clientType)
    {
        return view('admin.financementSettings.client_types.edit', compact('clientType'));
    }

    public function update(Request $request, ClientType $clientType)
    {
        $request->validate([
            'name' => 'required|string|unique:client_types,name,' . $clientType->id,
            'taux_interet' => 'required|numeric|min:0',
        ]);

        $clientType->update($request->only('name', 'taux_interet'));

        return redirect()->route('admin.client-types.index')->with('success', 'Type de client modifié.');
    }

    public function destroy(ClientType $clientType)
    {
        $clientType->delete();
        return redirect()->route('admin.client-types.index')->with('success', 'Type de client supprimé.');
    }
}
