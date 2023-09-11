<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['middleware' => ['auth']], function () {
    Route::resource('samples', \App\Http\Controllers\SampleController::class);
    Route::get('get-municipalities', [\App\Http\Controllers\MunicipalityController::class, 'getMunicipalities'])->name('getMunicipalities');
});
Route::resource('sampleDetails', \App\Http\Controllers\SampleDetailController::class);

