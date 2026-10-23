@extends('admin.layouts.app')

@section('title' , $brand->exists ? 'Edit Brand' : 'New Brand')



@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Brand</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New brand</h4>
                </div>
                <div class="card-content">
                    <div class="card-body row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <form action="{{ route($brand->exists ? 'admin.brands.update' : 'admin.brands.store' , $brand) }}"  method="post" class="form form-vertical" enctype="multipart/form-data">
                                @csrf
                                @method($brand->exists ? 'PUT' : 'POST')
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["class" => 'col', "label" => "Name" ,"name" => 'name', "value" => $brand->name])
                                        </div>
                                        <div class="col-12 my-2">
                                            <div class="form-group">
                                                <label for="logo">Logo</label>
                                                    <input type="file" name="logo" id="logo" class="form-control round @error('logo') is-invalid  @enderror" >
                                                @error('logo')
                                                    <div class="invalid-feedback">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                                @if($brand->exists)
                                                    <img src="{{ asset('storage/brands/'.$brand->logo) }}" width="30%">
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">
                                                @if ($brand->exists)
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
