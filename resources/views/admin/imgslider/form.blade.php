@extends('admin.layouts.app')

@section('title' , $imgslider->exists ? 'Edit imgslider' : 'New imgslider')



@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Image slider</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New Image slider</h4>
                </div>
                <div class="card-content">
                    <div class="card-body row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <form action="{{ route($imgslider->exists ? 'admin.imgslider.update' : 'admin.imgslider.store' , $imgslider) }}"  method="post" class="form form-vertical" enctype="multipart/form-data">
                                @csrf
                                @method($imgslider->exists ? 'PUT' : 'POST')
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["class" => 'col', "label" => "Name" ,"name" => 'name', "value" => $imgslider->name])
                                        </div>
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', [ "class" => 'col', "label" => "Link" ,"name" => 'link', "value" => $imgslider->link])
                                        </div>
                                        <div class="col-12 my-2 d-none">
                                            @include('admin.partials.input', [ "class" => 'col', "label" => "type" ,"name" => 'type', "value" => "desktop"])
                                        </div>
                                        <div class="col-12 my-2">
                                            <div class="form-group">
                                                <label for="image">image</label>
                                                    <input type="file" name="image" id="image" accept=".jpg,.jpeg,.png,.webp" class="form-control round @error('image') is-invalid  @enderror" >
                                                @error('image')
                                                    <div class="invalid-feedback">
                                                        {{ $message }}
                                                    </div>
                                                @enderror

                                                {{-- Size hint: these images are the front-page hero background --}}
                                                <div class="alert alert-light border mt-2 mb-2 py-2 px-3" style="font-size: 0.85rem;">
                                                    <div class="fw-bold mb-1"><i class="bi bi-info-circle"></i> Image de la page d'accueil (section hero)</div>
                                                    <ul class="mb-1 ps-3">
                                                        <li>Taille recommandée : <strong>1920 × 1080 px</strong> (format paysage 16:9).</li>
                                                        <li>Minimum : <strong>1200 × 500 px</strong> — <strong>JPG, PNG ou WEBP</strong>, <strong>5 Mo</strong> maximum.</li>
                                                        <li>Gardez la voiture <strong>au centre</strong> : les bords sont coupés sur mobile.</li>
                                                        <li>Préférez une image plutôt <strong>sombre</strong> : le titre blanc s'affiche par-dessus.</li>
                                                    </ul>
                                                    <div class="text-muted">Seules les images <strong>actives</strong> s'affichent : une seule = image fixe, plusieurs = elles défilent toutes les 5 secondes.</div>
                                                </div>

                                                @if($imgslider->exists)
                                                    <img src="{{ asset('storage/imgslider/'.$imgslider->image) }}" width="30%">
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-12 my-2">
                                            <div class="form-check form-switch fs-6">
                                                <input class="form-check-input  me-0" type="checkbox" name="active" id="active" value="1" @if(!$imgslider->exists || $imgslider->active != 0) checked=""  @endif>
                                                <label class="form-check-label" for="active">Active (affichée sur la page d'accueil)</label>
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">
                                                @if ($imgslider->exists)
                                                    Update
                                                @else
                                                    Save
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
    </div>
</section>
</div>
</div>
@endsection
