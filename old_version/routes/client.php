<?php

use App\Http\Controllers\Client\Auth\LoginController;
use App\Http\Controllers\Client\Auth\RegisterController;
use App\Http\Controllers\Client\Auth\LogoutController;
use App\Http\Controllers\Client\ClientAnnonceController;
use App\Http\Controllers\Client\EquipeController;

use App\Http\Controllers\Client\ClientNadoAutoEnchereController;
use App\Http\Controllers\Client\ClientNadoAutoEncheresBidController;
use App\Http\Controllers\Client\ClientDashboardController;
use App\Http\Controllers\FrontController;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Brand;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Route::prefix('client')->name('client.')->group(function () {

    // invités
    Route::middleware('guest:client')->group(function () {
        Route::get('/', [FrontController::class, 'index'])->name('home');
    Route::resource('nadoautoencheres', ClientNadoAutoEnchereController::class);

    Route::resource('equipe', \App\Http\Controllers\Client\EquipeController::class)
        ->only(['index', 'create', 'store', 'destroy']);
        Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
        Route::post('/login', [LoginController::class, 'login']);

        Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
        Route::post('/register', [RegisterController::class, 'register']);
    });

    // AJAX : modèles par marque (avec route model binding)
    Route::get('models-by-brand/{brand}', function (Brand $brand) {
        return $brand->modeles()->select('id', 'name')->get();
    });

    // authentifiés
    Route::middleware('auth:client')->group(function () {

        // Dashboard
        Route::get('/dashboard', [ClientDashboardController::class, 'index'])->name('dashboard');
        Route::get('/', [FrontController::class, 'index'])->name('home');

        // Déconnexion
        Route::post('/logout', [LogoutController::class, 'logout'])->name('logout');
 Route::get('/nadoautoencheres', [ClientNadoAutoEnchereController::class, 'index'])
        ->name('nadoautoencheres.index');
         Route::get('/nadoautoencheres/bids', [ClientNadoAutoEncheresBidController::class, 'index'])
        ->name('client.nadoautoencheresbid.index');
              Route::get('/export', [ClientNadoAutoEncheresBidController::class, 'export'])
            ->name('nadoautoencheresbid.export');
            Route::get('mes-bids', [App\Http\Controllers\Client\ClientNadoAutoEncheresBidController::class, 'show'])
        ->name('nadoautoencheresbid.mybids');
  
        
        Route::delete('/nadoautoencheres/bids/{id}', [ClientNadoAutoEncheresBidController::class, 'destroy'])
    ->name('client.nadoautoencheresbid.destroy')
    ->middleware('auth:client');

        // Annonces : au moins create + store (tu peux étendre avec index/show si besoin)
     // Annonces
     Route::get('/equipe', [EquipeController::class, 'index'])->name('equipe.index');
          Route::get('/equipe/create', [EquipeController::class, 'create'])->name('equipe.create');

          Route::post('/equipe/store', [EquipeController::class, 'store'])->name('equipe.store');

Route::get('/annonces', [ClientAnnonceController::class, 'index'])->name('annonces.index');
Route::get('/annonces/create', [ClientAnnonceController::class, 'create'])->name('annonces.create');
// Route::post('/annonces/upload-temp', [ClientAnnonceController::class, 'upload'])->name('annonces.upload');
Route::post('/annonces/upload-temp', [ClientAnnonceController::class, 'uploadTemp'])
    ->name('annonces.uploadTemp');

Route::get('/annonces/{id}/edit', [ClientAnnonceController::class, 'edit'])->name('annonces.edit');
Route::get('/', [FrontController::class, 'index']);

Route::post('/annonces', [ClientAnnonceController::class, 'store'])->name('annonces.store');
  // optionnel : index/show
        // Route::resource('annonces', ClientAnnonceController::class)->only(['index', 'show']);
    });
});

