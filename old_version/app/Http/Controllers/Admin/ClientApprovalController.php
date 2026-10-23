<?php

namespace App\Http\Controllers\Admin;

use App\Models\Client;
use App\Models\ClientType;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Mail\AccountApproved;

class ClientApprovalController extends Controller
{
    public function index()
    {
        $clients = Client::where('is_approved', false)->get();
        return view('admin.clients.approval', compact('clients'));
    }

    public function approve($id)
    {
        $client = Client::findOrFail($id);
        $client->is_approved = true;
        $client->save();

        // Send notification
        Mail::to($client->email)->send(new AccountApproved($client));

        return back()->with('success', 'Compte approuvé avec succès.');
    }
}
