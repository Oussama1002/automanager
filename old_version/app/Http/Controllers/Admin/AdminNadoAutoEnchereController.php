<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\NadoAutoEnchereRequest;
use App\Models\NadoAutoEnchere;
use App\Models\Brand;
use App\Models\Color;
use App\Models\Ville;
use Illuminate\Support\Str;

class AdminNadoAutoEnchereController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:admin', 'role:admin']);
    }

    public function index()
    {
        return view('admin.nadoautoenchere.index', [
            'encheres' => NadoAutoEnchere::all(),
            'brands' => Brand::all(),
            'city' => Ville::all(),
            'colors' => Color::all()
        ]);
    }

    public function create()
    {
        return view('admin.nadoautoenchere.form', [
            'encheres' => new NadoAutoEnchere,
            'brands' => Brand::all(),
            'city' => Ville::all(),
            'colors' => Color::all()
        ]);
    }

    public function store(NadoAutoEnchereRequest $request)
    {
        $data = $request->validated();
        $data['active'] = 1;
        $data['views'] = 0;

        // Handle checkboxes
        $checkboxes = ['active','garantie','certifie','showroom','finance','particulie', /* ... all other fields ... */ ];
        foreach ($checkboxes as $field) {
            $data[$field] = $request->has($field) ? 1 : 0;
        }

        // Handle images
        $images = [];
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $file) {
                $images[] = $this->saveImage($file, $data['mark'].'-'.$data['modele']);
            }
        }
        $data['images'] = $images;

        // Rapport PDF
        if ($request->hasFile('rapport')) {
            $data['rapport'] = $data['mark'].'-'.$data['modele'].'-'.rand(100000,999999).'.'.$request->rapport->extension();
            $request->rapport->move(storage_path('app/public/nadoautoenchere/pdf/'), $data['rapport']);
        }

        NadoAutoEnchere::create($data);

        return to_route('admin.nadoautoenchere.index')->with('success', 'Annonce enregistrée avec succès ✅');
    }

    public function edit($id)
    {
        return view('admin.nadoautoenchere.form', [
            'encheres' => NadoAutoEnchere::findOrFail($id),
            'brands' => Brand::all(),
            'city' => Ville::all(),
            'colors' => Color::all()
        ]);
    }

    public function update(NadoAutoEnchereRequest $request, $id)
    {
        $data = $request->validated();

        $checkboxes = ['active','garantie','certifie','showroom','finance','particulie', /* ... all other fields ... */ ];
        foreach ($checkboxes as $field) {
            $data[$field] = $request->has($field) ? 1 : 0;
        }

        $enchere = NadoAutoEnchere::findOrFail($id);

        // Keep old images
        $images = $enchere->images ?? [];
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $file) {
                $images[] = $this->saveImage($file, $data['mark'].'-'.$data['modele']);
            }
        }
        $data['images'] = $images;

        if ($request->hasFile('rapport')) {
            $data['rapport'] = $data['mark'].'-'.$data['modele'].'-'.rand(100000,999999).'.'.$request->rapport->extension();
            $request->rapport->move(storage_path('app/public/nadoautoenchere/pdf/'), $data['rapport']);
        }

        $enchere->update($data);

        return to_route('admin.nadoautoenchere.index')->with('success', 'Annonce mise à jour avec succès ✅');
    }

    public function destroy($id)
    {
        NadoAutoEnchere::where('id', $id)->delete();
        return to_route('admin.nadoautoenchere.index')->with('success', 'Annonce supprimée ✅');
    }

    private function saveImage($file, $title)
    {
        $imageName = Str::slug($title, '-') . '-' . rand(100000, 999999) . '.' . $file->getClientOriginalExtension();
        $file->move(storage_path('app/public/nadoautoenchere/'), $imageName);
        return $imageName;
    }
}
