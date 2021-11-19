<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PatientsController;
use App\Http\Controllers\StatusController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// info user login
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// user register & logn
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);


Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/status', [StatusController::class, 'index']);
    
    Route::get('/patients', [PatientsController::class, 'index']);
    Route::get('/patients/{id}', [PatientsController::class, 'show']);
    Route::post('/patients', [PatientsController::class, 'store']);
    Route::put('/patients/{id}', [PatientsController::class, 'update']);
    Route::delete('/patients/{id}', [PatientsController::class, 'destroy']);
    Route::get('/patients/search/{name}', [PatientsController::class, 'searchByName']);
    Route::get('/patients/status/positive', [PatientsController::class, 'statusPositive']);
    Route::get('/patients/status/recovered', [PatientsController::class, 'statusRecovered']);
    Route::get('/patients/status/dead', [PatientsController::class, 'statusDead']);
});
