@extends('admin.layouts.app')

@section('title' , 'Vente')

@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Vente</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Detail</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4 my-2">
                                Nom : <strong>{{ $vente->name }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Téléphone : <strong>{{ $vente->phone }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Ville : <strong>{{ $vente->city }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Marque : <strong>{{ $vente->mark }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Modele : <strong>{{ $vente->modele }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Année : <strong>{{ $vente->year }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Km : <strong>{{ $vente->km }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Carburant : <strong>{{ $vente->carburant }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Boite de vitesse : <strong>{{ $vente->box }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Etat : <strong>{{ $vente->etat }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Origine : <strong>{{ $vente->origine }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Type : <strong>{{ $vente->type }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Pack : <strong>{{ $vente->mode }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Rendez-vous : <strong>{{ $vente->rendezvous }}</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4 my-2">
                                Image avant :<br/>
                                <img class="activeimgnews" src="{{ asset('storage/vente/'.$vente->img_avant) }}" width="100%" >
                            </div>
                            <div class="col-4 my-2">
                                Image derriere :<br/>
                                <img class="activeimgnews" src="{{ asset('storage/vente/'.$vente->img_derriere) }}" width="100%" >
                            </div>
                            <div class="col-4 my-2">
                                Image carte grise :<br/>
                                <img class="activeimgnews" src="{{ asset('storage/vente/'.$vente->img_cartegrise) }}" width="100%" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
</div>
@endsection

