@extends('admin.layouts.app')




@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Annonces</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"> Annonce</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <form action="{{ route($ads->exists ? 'admin.annonces.update' : 'admin.annonces.store' , $ads) }}"  method="post" class="form form-vertical" enctype="multipart/form-data">
                            @csrf
                            @method($ads->exists ? 'PUT' : 'POST')
                            <div class="form-body">
                                <div class="row">
                                    @if($ads->exists)
                                    <div class="col-12 my-2">
                                        <div class="form-check form-switch fs-6">
                                            <input class="form-check-input  me-0" type="checkbox" name="active" id="active" value="1" @if($ads->active != 0) checked=""  @endif>
                                            <label class="form-check-label">Active</label>
                                        </div>
                                    </div>
                                    @endif
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Téléphone" , "type" => "text",  "value" => $ads->phone, "name" => 'phone', ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Prix" , "type" => "text",  "value" => $ads->prix, "name" => 'prix', ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="brand_id">Mark</label>
                                            <select name="mark" id="brand_id" class="form-select form-control nado-marks @error('brand_id') is-invalid  @enderror" >
                                                <option value="">Marque</option>
                                                @foreach($brands as $b)
                                                    <option value="{{ $b->name }}" data-id="{{$b->id}}" @selected($ads->mark == $b->name )>{{ $b->name }}</option>
                                                @endforeach
                                            </select>

                                            @error('brand_id')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="modele">Modèle</label>
                                            <select class="form-control nado-models" name="modele" id="modele" required>
                                                <option value="">Modèle</option>
                                                @if($ads->modele)
                                                <option value="{{$ads->modele}}" selected>{{$ads->modele}}</option>
                                                @endif
                                            </select>

                                            @error('modele')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="city">Ville</label>
                                            <select class="form-control" name="city" id="city" required>
                                                <option value="">Sélectionner</option>
                                                @foreach($city as $c)
                                                    <option title="{{$c->name}}" value="{{$c->name}}" @selected($ads->city == $c->name )>
                                                        {{$c->name}}
                                                    </option>
                                                @endforeach
                                            </select>

                                            @error('city')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="status">status</label>
                                            <select class="form-control" name="status" id="status" required>
                                                <option value="">Sélectionner</option>
                                                <option title="disponible" value="disponible" @selected($ads->status == "disponible" )>
                                                    Disponible
                                                </option>
                                                <option title="réserve" value="réserve" @selected($ads->status == "réserve" )>
                                                    Réserve
                                                </option>
                                                <option title="vendu" value="vendu" @selected($ads->status == "vendu" )>
                                                    Vendu
                                                </option>
                                            </select>

                                            @error('status')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="year">Année</label>
                                            <select class="form-control" name="year" id="year" required>
                                                <option value="">Sélectionner</option>
                                                @for ($i = date("Y"); $i >= 1992; $i--)
                                                    <option title="{{$i}}" value="{{$i}}" @selected($ads->year == $i )>
                                                        {{$i}}
                                                    </option>
                                                @endfor
                                            </select>

                                            @error('year')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Km" , "type" => "text", "name" => 'km', "value" => $ads->km, ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="cv">Puissance fiscale</label>
                                            <select class="form-control" name="cv" id="cv" required>
                                                <option value="">Sélectionner</option>
                                                @for ($i = 2; $i <= 60; $i++)
                                                    <option title="{{$i}}" value="{{$i}}" @selected($ads->cv == $i )>
                                                        {{$i}}
                                                    </option>
                                                @endfor
                                            </select>

                                            @error('cv')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Carburant" ,"name" => 'carburant', "value" => $ads->carburant, "data" => ["" => "Sélectionner", "essence" => "Essence", "diesel" => "Diesel", "electrique" => "Electrique", "hybride" => "Hybride"]])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Boite de vitesses" ,"name" => 'box', "value" => $ads->box, "data" => ["" => "Sélectionner", "manuelle" => "Manuelle", "automatique" => "Automatique"]])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "etat" ,"name" => 'etat', "value" => $ads->etat, "data" => ["" => "Sélectionner", "excellent" => "Excellent", "très bon" => "Trés bon", "bon" => "Bon", "correct" => "Correct", "endommagé" => "Endommagé", "neuf" => "Neuf"]])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Origine" ,"name" => 'origine', "value" => $ads->origine, "data" => ["" => "Sélectionner", "dédouané" => "Dédouané", "WW au Maroc" => "WW au Maroc", "importé neuf" => "Importé neuf", "pas encore dédouané" => "Pas encore dédouané"]])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="nb_Door">Nombre de portes</label>
                                            <select class="form-control" name="nb_Door" id="nb_Door" required>
                                                <option value="">Sélectionner</option>
                                                @for ($i = 2; $i <= 10; $i++)
                                                    <option title="{{$i}}" value="{{$i}}"  @selected($ads->nb_Door == $i )>
                                                        {{$i}}
                                                    </option>
                                                @endfor
                                            </select>

                                            @error('nb_Door')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="bodywork">Carrosserie</label>
                                            <select class="form-control" id="bodywork" name="bodywork" >
                                                <option value="">Sélectionner</option>
                                                <option title="Cabriolet" value="coupé cabriolet" @selected($ads->bodywork == "coupé cabriolet" )>COUPé CABRIOLET</option>
                                                <option title="Suv et 4x4" value="suv et 4x4" @selected($ads->bodywork == "suv et 4x4" )>SUV ET 4X4</option>
                                                <option title="Citadine" value="citadine" @selected($ads->bodywork == "citadine" )>CITADINE</option>
                                                <option title="Berline" value="berline" @selected($ads->bodywork == "berline" )>BERLINE</option>
                                                <option title="Compact" value="compact" @selected($ads->bodywork == "compact" )>COMPACT</option>
                                                <option title="Crossover" value="crossover" @selected($ads->bodywork == "crossover" )>CROSSOVER</option>
                                                <option title="Pick up" value="pick up" @selected($ads->bodywork == "pick up" )>PICK UP</option>
                                            </select>

                                            @error('bodywork')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Première main" ,"name" => 'premiere_main', "value" => $ads->premiere_main, "data" => ["" => "Sélectionner", "non" => "Non", "oui" => "Oui"]])
                                    </div>
                                    <div class="col-6 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="city">Couleur</label>
                                            <select class="form-control" name="colors" id="colors" >
                                                <option value="">Sélectionner</option>
                                                @foreach($colors as $c)
                                                    <option title="{{$c->name}}" value="{{$c->name}}" @selected($ads->colors == $c->name )>
                                                        {{$c->name}}
                                                    </option>
                                                @endforeach
                                            </select>

                                            @error('city')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Titre" , "type" => "text",  "value" => $ads->titre, "name" => 'titre', ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Video" , "type" => "text",  "value" => $ads->video, "name" => 'video', ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Reel" , "type" => "text",  "value" => $ads->reel, "name" => 'reel', ])
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="garantie" name="garantie"  value="1" @if($ads->garantie == 1) checked @endif>
                                            <label class="form-check-label" for="garantie">Garantie</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="showroom" name="showroom"  value="1" @if($ads->showroom == 1) checked @endif>
                                            <label class="form-check-label" for="showroom">Showroom</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="finance" name="finance"  value="1" @if($ads->finance == 1) checked @endif>
                                            <label class="form-check-label" for="finance">Finance</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="certifie" name="certifie"  value="1" @if($ads->certifie == 1) checked @endif>
                                            <label class="form-check-label" for="certifie">certifié</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="particulie" name="particulie"  value="1" @if($ads->particulie == 1) checked @endif>
                                            <label class="form-check-label" for="particulie">particulier</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="jantesA" name="jantesA"  value="1" @if($ads->jantesA == 1) checked @endif>
                                            <label class="form-check-label" for="jantesA">Jantes aluminium</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="airbags" name="airbags"  value="1" @if($ads->airbags == 1) checked @endif>
                                            <label class="form-check-label" for="airbags">Airbags</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="climatisation" name="climatisation"  value="1" @if($ads->climatisation == 1) checked @endif>
                                            <label class="form-check-label" for="climatisation">Climatisation</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="gps" name="gps"  value="1" @if($ads->gps == 1) checked @endif>
                                            <label class="form-check-label" for="gps">Système de navigation</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="toit_ouvrant" name="toit_ouvrant"  value="1" @if($ads->toit_ouvrant == 1) checked @endif>
                                            <label class="form-check-label" for="toit_ouvrant">Toit ouvrant</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="double_toit_ouvrant" name="double_toit_ouvrant"  value="1" @if($ads->double_toit_ouvrant == 1) checked @endif>
                                            <label class="form-check-label" for="double_toit_ouvrant">Double toit ouvrant</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="siege_cuir" name="siege_cuir"  value="1" @if($ads->siege_cuir == 1) checked @endif>
                                            <label class="form-check-label" for="siege_cuir">Siège cuir</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="radar_recul" name="radar_recul"  value="1" @if($ads->radar_recul == 1) checked @endif>
                                            <label class="form-check-label" for="radar_recul">Radar de recul</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="camera_recul" name="camera_recul"  value="1" @if($ads->camera_recul == 1) checked @endif>
                                            <label class="form-check-label" for="camera_recul">Caméra de recul</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="vitres_electriques" name="vitres_electriques"  value="1" @if($ads->vitres_electriques == 1) checked @endif>
                                            <label class="form-check-label" for="vitres_electriques">Vitres éléctriques</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="abs" name="abs"  value="1" @if($ads->abs == 1) checked @endif>
                                            <label class="form-check-label" for="abs">ABS</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-2 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="eps" name="eps"  value="1" @if($ads->eps == 1) checked @endif>
                                            <label class="form-check-label" for="eps">EPS</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="rv" name="rv"  value="1" @if($ads->rv == 1) checked @endif>
                                            <label class="form-check-label" for="rv">Régulateur de vitesse</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="lv" name="lv"  value="1" @if($ads->lv == 1) checked @endif>
                                            <label class="form-check-label" for="lv">Limiteur de vitesse</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="cd" name="cd"  value="1" @if($ads->cd == 1) checked @endif>
                                            <label class="form-check-label" for="cd">Cd/mp3/bluetooth</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-3 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="ordinateur" name="ordinateur"  value="1" @if($ads->ordinateur == 1) checked @endif>
                                            <label class="form-check-label" for="ordinateur">Ordinateur de bord</label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-4 my-2">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="verrouillage" name="verrouillage"  value="1" @if($ads->verrouillage == 1) checked @endif>
                                            <label class="form-check-label" for="verrouillage">Verrouillage centralisé à distance</label>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12 my-2">
                                        <div class="form-group col">
                                        <label for="userfile">Photos</label>
                                            <div class="choose-file text-center py-2 rounded bg-white">
                                                <div class="msgImage">
                                                </div>
                                                <div class="input-images">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="image">image</label>
                                                <input type="file" name="image" id="image" class="form-control round @error('image') is-invalid  @enderror" >
                                            @error('image')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->image)
                                                <img src="{{ asset('storage/ads/'.$ads->image) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="rapport">rapport pdf</label>
                                                <input type="file" name="rapport" id="rapport" class="form-control round @error('rapport') is-invalid  @enderror" >
                                            @error('rapport')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->rapport)
                                                <embed src="{{ asset('storage/pdf/'.$ads->rapport) }}" type="application/pdf" width="40%" />
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imgrapport">image rapport</label>
                                                <input type="file" name="imgrapport" id="imgrapport" class="form-control round @error('imgrapport') is-invalid  @enderror" >
                                            @error('imgrapport')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imgrapport)
                                                <img src="{{ asset('storage/ads/'.$ads->imgrapport) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imgrleft">Face avant</label>
                                                <input type="file" name="imgrleft" id="imgrleft" class="form-control round @error('imgrleft') is-invalid  @enderror" >
                                            @error('imgrleft')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imgrleft)
                                                <img src="{{ asset('storage/ads/'.$ads->imgrleft) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imgrtop">Le côté droit</label>
                                                <input type="file" name="imgrtop" id="imgrtop" class="form-control round @error('imgrtop') is-invalid  @enderror" >
                                            @error('imgrtop')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imgrtop)
                                                <img src="{{ asset('storage/ads/'.$ads->imgrtop) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imgrmed">plafond de voiture </label>
                                                <input type="file" name="imgrmed" id="imgrmed" class="form-control round @error('imgrmed') is-invalid  @enderror" >
                                            @error('imgrmed')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imgrmed)
                                                <img src="{{ asset('storage/ads/'.$ads->imgrmed) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imgrbottom"> Le côté gauche </label>
                                                <input type="file" name="imgrbottom" id="imgrbottom" class="form-control round @error('imgrbottom') is-invalid  @enderror" >
                                            @error('imgrbottom')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imgrbottom)
                                                <img src="{{ asset('storage/ads/'.$ads->imgrbottom) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imgrright">Le côté arrière</label>
                                                <input type="file" name="imgrright" id="imgrright" class="form-control round @error('imgrright') is-invalid  @enderror" >
                                            @error('imgrright')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imgrright)
                                                <img src="{{ asset('storage/ads/'.$ads->imgrright) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        <div class="form-group">
                                            <label for="imginterior">intérieur de la voiture</label>
                                                <input type="file" name="imginterior" id="imginterior" class="form-control round @error('imgrright') is-invalid  @enderror" >
                                            @error('imginterior')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                            @if($ads->imginterior)
                                                <img src="{{ asset('storage/ads/'.$ads->imginterior) }}" width="40%">
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "CO2" , "type" => "text",  "value" => $ads->co2, "name" => 'co2', ])
                                    </div>
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">
                                            @if ($ads->exists)
                                                Update
                                            @else
                                                Add new Annonce
                                            @endif
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
</div>
@endsection
@section('script')
<script  src="{{ asset('assets/back/assets/js/uploader/image-uploader.min.js') }}"></script>
<script>
    $(function (){
            let preloaded = [
                @foreach ($ads->media as $med)
                    {id: {{ $med->id }}, src: "{{ asset('storage/ads/'.$med->name) }}" },
                @endforeach
                ];
            $('.input-images').imageUploader({
                preloaded: preloaded
            });
        });
$(document).ready(function(){
    $("select.nado-marks").change(function () {
        $('select.nado-models').html("<option> Chargement en cours ... </option>").prop('disabled', 'disabled');
        var mark = $('select.nado-marks option:selected').attr('data-id');
        var formData = {
            'mark': mark,
            '_token' : $('input[name="_token"]').val()
        };
        var ajaxurl = "/admin/models/"+mark+"/getmodels";
        var models = '<option value="">Selectionner un modele</option>';
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: formData,
            dataType: 'json',
            success: function (data) {
                for(var i =0;i < data.length;i++){
                    models += '<option value="' + data[i].name + '">' + data[i].name + '</option>';
                 }

                console.log(models);
            },
            complete:function(){
                $('select.nado-models').html("").append(models).prop('disabled', false);
            }
        });
    });


    $('.delete-image').click(function(){
    	let id = $(this).parent('.uploaded-image').children('input').val();
        //delete media
         $.ajax({
           url: '/admin/annonces/'+id+'/deleteImage',
           type: 'post',
           data: {
        	"_token": "{{ csrf_token() }}",
        	},
           success: function(response){
               console.log(response);
           }
        });
    });


    });

</script>
@endsection

