@extends('admin.layouts.app')

@section('title' , $model->exists ? 'Edit Model' : 'New Model')



@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Model</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New Model</h4>
                </div>
                <div class="card-content">
                    <div class="card-body row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <form action="{{ route($model->exists ? 'admin.models.update' : 'admin.models.store' , $model) }}"  method="post" class="form form-vertical" enctype="multipart/form-data">
                                @csrf
                                @method($model->exists ? 'PUT' : 'POST')
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["class" => 'col', "label" => "Name" ,"name" => 'name', "value" => $model->name])
                                        </div>
                                        <div class="col-12 my-2">

                                        <div class="form-group col">
                                            <label for="brand_id">Mark</label>
                                            <select name="brand_id" id="brand_id" class="form-select form-control @error('brand_id') is-invalid  @enderror" >
                                                <option value="">Mark</option>
                                                @foreach($brands as $b)
                                                    <option value="{{ $b->id }}" @selected($model->brand_id == $b->id )>{{ $b->name }}</option>
                                                @endforeach
                                            </select>

                                            @error('brand_id')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">
                                                @if ($model->exists)
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
