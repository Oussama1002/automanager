<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
  public function up()
{
    Schema::create('nado_auto_encheres', function (Blueprint $table) {
        $table->id();
        $table->string('phone')->nullable();
        $table->string('titre')->nullable();
        $table->decimal('prix', 10, 2)->nullable();
        $table->string('mark')->nullable();
        $table->string('modele')->nullable();
        $table->year('year')->nullable();
        $table->integer('km')->nullable();
        $table->string('carburant')->nullable();
        $table->string('box')->nullable();
        $table->string('etat')->nullable();
        $table->string('city')->nullable();
        $table->string('cv')->nullable();
        $table->string('nb_Door')->nullable();
        $table->string('origine')->nullable();
        $table->boolean('premiere_main')->default(0);
        $table->string('video')->nullable();
        $table->boolean('reel')->default(0);
        $table->string('bodywork')->nullable();
        $table->string('status')->nullable();
            $table->json('images')->nullable();
        $table->text('rapport')->nullable();
        $table->string('co2')->nullable();
        $table->boolean('certifie')->default(0);
        $table->boolean('particulie')->default(0);
        $table->boolean('showroom')->default(0);
        $table->boolean('finance')->default(0);

        // Options booléennes
        $table->boolean('jantesA')->default(0);
        $table->boolean('airbags')->default(0);
        $table->boolean('climatisation')->default(0);
        $table->boolean('gps')->default(0);
        $table->boolean('toit_ouvrant')->default(0);
        $table->boolean('double_toit_ouvrant')->default(0);
        $table->boolean('siege_cuir')->default(0);
        $table->boolean('radar_recul')->default(0);
        $table->boolean('camera_recul')->default(0);
        $table->boolean('vitreselec')->default(0);
        $table->boolean('abs')->default(0);
        $table->boolean('eps')->default(0);
        $table->boolean('esp')->default(0);
        $table->boolean('antipatinage')->default(0);
        $table->boolean('aide_freinage_urgence')->default(0);
        $table->boolean('antidemarrage_electronique')->default(0);
        $table->boolean('aide_demarrage_cote')->default(0);
        $table->boolean('selecteur_mode_conduite')->default(0);
        $table->boolean('detection_fatigue')->default(0);
        $table->boolean('maintien_dans_la_voie')->default(0);
        $table->boolean('detecteur_angle_mort')->default(0);
        $table->boolean('detecteur_sous_gonflage')->default(0);
        $table->boolean('fermeture_portes_auto')->default(0);
        $table->boolean('preparation_isofix')->default(0);
        $table->boolean('phares_antibrouillard')->default(0);
        $table->boolean('systeme_alarme')->default(0);
        $table->boolean('start_stop')->default(0);
        $table->boolean('regulateur_vitesse')->default(0);
        $table->boolean('detecteur_pluie')->default(0);
        $table->boolean('allumage_auto_feux')->default(0);
        $table->boolean('frein_main_electrique')->default(0);
        $table->boolean('aide_stationnement')->default(0);
        $table->boolean('volant_reglable')->default(0);
        $table->boolean('retros_electriques')->default(0);
        $table->boolean('retros_rabat_electriques')->default(0);
        $table->boolean('coffre_electrique')->default(0);
        $table->boolean('sieges_electriques')->default(0);
        $table->boolean('sieges_elec_memoire')->default(0);
        $table->boolean('banquette_rabattable')->default(0);
        $table->boolean('ecran_tactile')->default(0);
        $table->boolean('cockpit_digital')->default(0);
        $table->boolean('commandes_volant')->default(0);
        $table->boolean('commandes_vocales')->default(0);
        $table->boolean('reconnaissance_panneaux')->default(0);
        $table->boolean('affichage_tete_haute')->default(0);
        $table->boolean('systeme_audio')->default(0);
        $table->boolean('wifi_bord')->default(0);
        $table->boolean('bluetooth')->default(0);
        $table->boolean('compatibilite_smartphone')->default(0);
        $table->boolean('apple_carplay_android_auto')->default(0);
        $table->boolean('chargeur_sans_fil')->default(0);
        $table->boolean('sellerie_similicuir_tissu')->default(0);
        $table->boolean('volant_cuir')->default(0);
        $table->boolean('follow_me_home')->default(0);
        $table->boolean('lumiere_ambiance')->default(0);
        $table->boolean('feux_jour_led')->default(0);
        $table->boolean('phares_full_led')->default(0);
        $table->boolean('toit_panoramique')->default(0);
        $table->boolean('barres_de_toit')->default(0);
        $table->boolean('vitres_surteintees')->default(0);

        $table->integer('views')->default(0);
        $table->boolean('active')->default(1);
        $table->timestamps();
        $table->softDeletes();
        $table->boolean('verified')->default(0);
        $table->boolean('is_homepage')->default(0);
        $table->string('colors')->nullable();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nado_auto_encheres');
    }
};
