@extends('admin.layouts.app')

@section('title' , $user->exists ? 'Edit User' : 'New User')


@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Users</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Add User</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <form action="{{ route($user->exists ? 'admin.users.update' : 'admin.users.store' , $user) }}"  method="post" class="form form-vertical">
                            @csrf
                            @method($user->exists ? 'PUT' : 'POST')
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Name" ,"name" => 'name', "value" => $user->name, "hasicon" => "person" ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Email" , "type" => "email", "name" => 'email', "value" => $user->email, "hasicon" => "envelope" ])
                                    </div>
                                    <div class="col-12 col-md-12 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Role" ,"name" => 'role', "value" => $user->role, "data" => ["admin" => "Admin", "member" => "Member"], "hasicon" => "building" ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Password" , "type" => "password", "name" => 'password', "hasicon" => "lock" ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Confirm Password", "type" => "password", "name" => 'password_confirmation', "hasicon" => "lock" ])
                                    </div>
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">
                                            @if ($user->exists)
                                                Update
                                            @else
                                                Add new user
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
</section>
</div>
</div>
@endsection
