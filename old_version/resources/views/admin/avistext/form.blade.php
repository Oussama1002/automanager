@extends('admin.layouts.app')

@section('title' , $avistext->exists ? 'Edit avistext' : 'New avistext')



@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>avis text</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New avis text</h4>
                </div>
                <div class="card-content">
                    <div class="card-body row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <form action="{{ route($avistext->exists ? 'admin.avistext.update' : 'admin.avistext.store' , $avistext) }}"  method="post" class="form form-vertical" enctype="multipart/form-data">
                                @csrf
                                @method($avistext->exists ? 'PUT' : 'POST')
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["class" => 'col', "label" => "Name" ,"name" => 'name', "value" => $avistext->name])
                                        </div>
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', [ "class" => 'col', "label" => "Job" ,"name" => 'job', "value" => $avistext->job])
                                        </div>
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["type" => "textarea", "class" => 'col', "label" => "Text" ,"name" => 'text', "value" => $avistext->text])
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
                                                @if($avistext->exists)
                                                    <img src="{{ asset('storage/avistext/'.$avistext->image) }}" width="30%">
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">
                                                @if ($avistext->exists)
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
