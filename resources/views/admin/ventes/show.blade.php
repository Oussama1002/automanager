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
                                Raison sociale : <strong>{{ $vente->mark }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Secteur : <strong>{{ $vente->modele }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Taille de flotte : <strong>{{ $vente->year }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                ICE : <strong>{{ $vente->ice }}</strong>
                            </div>
                            <div class="col-4 my-2">
                                Pack : <strong>{{ $vente->mode }}</strong>
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

