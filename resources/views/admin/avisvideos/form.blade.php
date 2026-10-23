@extends('admin.layouts.app')

@section('title' , $avisvideos->exists ? 'Edit Avis videos' : 'New Avis videos')



@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Avis videos</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">New Avis videos</h4>
                </div>
                <div class="card-content">
                    <div class="card-body row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <form action="{{ route($avisvideos->exists ? 'admin.avisvideos.update' : 'admin.avisvideos.store' , $avisvideos) }}"  method="post" class="form form-vertical" enctype="multipart/form-data">
                                @csrf
                                @method($avisvideos->exists ? 'PUT' : 'POST')
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["class" => 'col', "label" => "Title" ,"name" => 'title', "value" => $avisvideos->title])
                                        </div>
                                        <div class="col-12 my-2">
                                            @include('admin.partials.input', ["class" => 'col', "label" => "video key youtube" ,"name" => 'video_key', "value" => $avisvideos->video_key])
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">
                                                @if ($avisvideos->exists)
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
