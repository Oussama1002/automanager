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
                                                    <input type="file" name="image" id="image" class="form-control round @error('image') is-invalid  @enderror" >
                                                @error('image')
                                                    <div class="invalid-feedback">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                                @if($imgslider->exists)
                                                    <img src="{{ asset('storage/imgslider/'.$imgslider->image) }}" width="30%">
                                                @endif
                                            </div>
                                        </div>
                                        @if($imgslider->exists)
                                        <div class="col-12 my-2">
                                            <div class="form-check form-switch fs-6">
                                                <input class="form-check-input  me-0" type="checkbox" name="active" id="active" value="1" @if($imgslider->active != 0) checked=""  @endif>
                                                <label class="form-check-label">Active</label>
                                            </div>
                                        </div>
                                        @endif
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
