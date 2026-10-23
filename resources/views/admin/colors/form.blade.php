@extends('admin.layouts.app')

@section('title' , $color->exists ? 'Edit Color' : 'New Color')



@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Couleurs</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New Couleur</h4>
                </div>
                <div class="card-content">
                    <div class="card-body row">
                        <div class="col-md-6 col-12 offset-md-3">
               <form action="{{ route($color->exists ? 'admin.colors.update' : 'admin.colors.store', $color) }}" method="post">
    @csrf
    @method($color->exists ? 'PUT' : 'POST')

                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12 my-2">
@include('admin.partials.input', ["class" => 'col', "label" => "Name", "name" => 'name', "value" => $color->name])
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">
                                               @if ($color->exists)
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
