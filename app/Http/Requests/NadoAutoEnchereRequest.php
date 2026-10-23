<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NadoAutoEnchereRequest extends FormRequest
{
    public function authorize(): bool
    {
        // Allow admin (adjust if you want role-based check)
        return true;
    }

    public function rules(): array
    {
        $rules = [
            'phone'       => 'required|string|max:20',
            'prix'        => 'required|numeric|min:0',
            'mark'        => 'required|string|max:255',
            'modele'      => 'required|string|max:255',
            'city'        => 'required|string|max:255',
            'status'      => 'nullable|string|max:255',
            'year'        => 'required|integer|min:1900|max:' . (date('Y') + 1),
            'km'          => 'nullable|integer|min:0',
            'cv'          => 'nullable|integer|min:0',
            'carburant'   => 'nullable|string|max:50',
            'box'         => 'nullable|string|max:50',
            'origine'     => 'nullable|string|max:255',
'nb_Door' => 'nullable|integer|min:2|max:6',
            'bodywork'    => 'nullable|string|max:255',
'premiere_main' => 'nullable|in:oui,non',
            'colors'      => 'nullable|string|max:255',
                       'titre'       => 'required|string|max:255',
            'prix'        => 'required|numeric|min:0',
            'mark'        => 'required|string|max:255',
            'modele'      => 'required|string|max:255',
            'year'        => 'required|integer|min:1900|max:' . (date('Y') + 1),
            'km'          => 'nullable|numeric|min:0',
            'carburant'   => 'nullable|string|max:100',
            'box'         => 'nullable|string|max:100',
            'city'        => 'nullable|string|max:100',
            'cv'          => 'nullable|string|max:100',
            'nb_Door'     => 'nullable|integer|min:2|max:6',
            'origine'     => 'nullable|string|max:255',
            'premiere_main' => 'nullable|boolean',

            // Media
            'video'       => 'nullable|url',
            'rapport'     => 'nullable|file|mimes:pdf,jpg,png,doc,docx',
  // Images
        'images'      => $this->isMethod('post') ? 'required|array' : 'nullable|array',
        'images.*'    => 'image|mimes:jpeg,png,jpg,gif,webp|max:5120',
            // Flags
            'certifie'    => 'nullable|boolean',
            'particulie'  => 'nullable|boolean',
            'showroom'    => 'nullable|boolean',
            'finance'     => 'nullable|boolean',
        'active'      => 'sometimes|boolean',
            'verified'    => 'nullable|boolean',
  // 🆕 Dates
        'starts_at'   => 'nullable|date',
        'ends_at'     => 'nullable|date|after:starts_at',
            // All options (booleans)
            'jantesA'     => 'sometimes|boolean',
            'airbags'     => 'sometimes|boolean',
            'climatisation' => 'sometimes|boolean',
            'gps'         => 'sometimes|boolean',
            'toit_ouvrant' => 'sometimes|boolean',
            'double_toit_ouvrant' => 'sometimes|boolean',
            'siege_cuir'  => 'sometimes|boolean',
            'radar_recul' => 'sometimes|boolean',
            'camera_recul' => 'sometimes|boolean',
            'abs'         => 'sometimes|boolean',
            'eps'         => 'sometimes|boolean',
            'esp'         => 'sometimes|boolean',
            'antipatinage' => 'sometimes|boolean',
            'aide_freinage_urgence' => 'sometimes|boolean',
            'antidemarrage_electronique' => 'sometimes|boolean',
            'aide_demarrage_cote' => 'sometimes|boolean',
            'selecteur_mode_conduite' => 'sometimes|boolean',
            'detection_fatigue' => 'sometimes|boolean',
            'maintien_dans_la_voie' => 'sometimes|boolean',
            'detecteur_angle_mort' => 'sometimes|boolean',
            'detecteur_sous_gonflage' => 'sometimes|boolean',
            'fermeture_portes_auto' => 'sometimes|boolean',
            'preparation_isofix' => 'sometimes|boolean',
            'phares_antibrouillard' => 'sometimes|boolean',
            'systeme_alarme' => 'sometimes|boolean',
            'start_stop' => 'sometimes|boolean',
            'regulateur_vitesse' => 'sometimes|boolean',
            'detecteur_pluie' => 'sometimes|boolean',
            'allumage_auto_feux' => 'sometimes|boolean',
            'frein_main_electrique' => 'sometimes|boolean',
            'aide_stationnement' => 'sometimes|boolean',
            'volant_reglable' => 'sometimes|boolean',
            'retros_electriques' => 'sometimes|boolean',
            'retros_rabat_electriques' => 'sometimes|boolean',
            'coffre_electrique' => 'sometimes|boolean',
            'sieges_electriques' => 'sometimes|boolean',
            'sieges_elec_memoire' => 'sometimes|boolean',
            'banquette_rabattable' => 'sometimes|boolean',
            'ecran_tactile' => 'sometimes|boolean',
            'cockpit_digital' => 'sometimes|boolean',
            'commandes_volant' => 'sometimes|boolean',
            'commandes_vocales' => 'sometimes|boolean',
            'reconnaissance_panneaux' => 'sometimes|boolean',
            'affichage_tete_haute' => 'sometimes|boolean',
            'systeme_audio' => 'sometimes|boolean',
            'wifi_bord' => 'sometimes|boolean',
            'bluetooth' => 'sometimes|boolean',
            'compatibilite_smartphone' => 'sometimes|boolean',
            'apple_carplay_android_auto' => 'sometimes|boolean',
            'chargeur_sans_fil' => 'sometimes|boolean',
            'sellerie_similicuir_tissu' => 'sometimes|boolean',
            'volant_cuir' => 'sometimes|boolean',
            'follow_me_home' => 'sometimes|boolean',
            'lumiere_ambiance' => 'sometimes|boolean',
            'feux_jour_led' => 'sometimes|boolean',
            'phares_full_led' => 'sometimes|boolean',
            'toit_panoramique' => 'sometimes|boolean',
            'barres_de_toit' => 'sometimes|boolean',
            'vitres_surteintees' => 'sometimes|boolean',
        ];

        // Require images only on create (POST)
        if ($this->isMethod('post')) {
            $rules['images'] = 'required';
        }

        return $rules;
    }

    public function messages(): array
    {
        return [
            'phone.required'   => 'Le numéro de téléphone est obligatoire.',
            'prix.required'    => 'Le prix est obligatoire.',
            'mark.required'    => 'La marque est obligatoire.',
            'modele.required'  => 'Le modèle est obligatoire.',
            'city.required'    => 'La ville est obligatoire.',
            'year.required'    => 'L\'année est obligatoire.',
            'titre.required'   => 'Le titre est obligatoire.',
            'images.required'  => 'Au moins une image est obligatoire.',
            'images.*.image'   => 'Chaque fichier doit être une image valide.',
        ];
    }
}
