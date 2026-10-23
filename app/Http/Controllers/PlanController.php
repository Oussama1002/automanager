<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pack;


class PlanController extends Controller
{

public function index()
{
    $packs = Pack::all();
    return view('plans.index', compact('packs'));
}

}
