<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Artisan;

/*
|--------------------------------------------------------------------------
| Console Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of your Closure based console
| commands. Each Closure is bound to a command instance allowing a
| simple approach to interacting with each command's IO methods.
|
*/

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

if (App::environment() === 'production') {
    Artisan::command('migrate:fresh', function () {
        $this->comment('You are not allowed to do this.Contact nado tech team !');

        /*
         $this->ask("Are you sure you want to run this command ? ", "Yes");
        $p =  $this->secret('Your password');
         if ($this->confirm('Do you wish to continue?', true)) {
         }
         */

    })->describe('Override default command in production.');

    Artisan::command('migrate:refresh', function () {
        $this->comment('You are not allowed to do this.Contact nado tech team !');
    })->describe('Override default command in production.');
}
