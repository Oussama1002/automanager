@extends('admin.layouts.app')

@section('title', 'Stories | nado.ma')

@section('content')
    <div id="main-content">
        <div class="page-heading">
            <h3>Stories</h3>
        </div>
        <div class="page-content">
            <section class="row">
                <div class="row" id="table-striped">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <h4 class="card-title">List Stories</h4>
                                <a href="{{ route('admin.stories.create') }}" class="btn btn-primary float-right">Add New
                                    Story</a>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="table-responsive mx-4 my-2">
                                        <table class="table table-striped mb-0 display" id="example">
                                            <thead>
                                                <tr>
                                                    <th>Media</th>
                                                    <th>Type</th>
                                                    <th>Views</th>
                                                    <th>Expires At</th>
                                                    <th class="d-flex justify-content-end">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($stories as $story)
                                                    <tr>
                                                        <td width="10%">
                                                            {{-- DEBUG: Show the actual path --}}
                                                            <!-- <small>Path: {{ $story->media_path }}</small> -->
                                                            @if ($story->media_type == 'image')
                                                                {{-- FIX: Removed 'stories/' because $story->media_path already has it --}}
                                                                <img src="{{ asset('storage/' . $story->media_path) }}"
                                                                    alt="Story" width="80">
                                                            @else
                                                                {{-- FIX: Same here for video --}}
                                                                <video src="{{ asset('storage/' . $story->media_path) }}"
                                                                    width="100%" controls></video>
                                                            @endif
                                                        </td>
                                                        <td>{{ ucfirst($story->media_type) }}</td>
                                                        <td>{{ $story->views }}</td>
                                                        <td>{{ $story->expires_at }}</td>
                                                        <td>
                                                            <div class="d-flex gap-2 w-100 justify-content-end">
                                                                <form
                                                                    action="{{ route('admin.stories.destroy', $story->id) }}"
                                                                    method="POST" class="d-inline">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                    <button type="submit" class="btn btn-danger btn-sm"
                                                                        onclick="return confirm('Are you sure?')">Delete</button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
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
