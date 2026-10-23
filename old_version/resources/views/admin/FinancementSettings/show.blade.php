@extends('admin.layouts.app')

@section('title' , 'Finance')

@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Finance</h3>
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
                                Nom : <strong>{{ $finance->name }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Téléphone : <strong>{{ $finance->phone }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Ville : <strong>{{ $finance->city }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Marque : <strong>{{ $finance->mark }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Modele : <strong>{{ $finance->modele }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Année : <strong>{{ $finance->year }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Credits en cours : <strong>{{ $finance->creditsencours }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Durée : <strong>{{ $finance->duree }} Mois</strong>
                            </div>
                            <div class="col-4 my-2">
                                Prix : <strong>{{ $finance->prixcar }} Dhs</strong>
                            </div>
                            <div class="col-4 my-2">
                                Votre apport : <strong>{{ $finance->montant }} Dhs</strong>
                            </div>
                            <div class="col-4 my-2">
                                Credits : <strong>{{ $finance->creditsdh }} Dhs</strong>
                            </div>
                            <div class="col-4 my-2">
                                Email : <strong>{{ $finance->email }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Cin : <strong>{{ $finance->cin }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Rendez-vous : <strong>{{ $finance->rendezvous }}</strong>
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

