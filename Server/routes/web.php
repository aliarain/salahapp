<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ConfigureController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [ConfigureController::class, 'index']);
Route::post('/configure/purchase', [ConfigureController::class, 'purchase']);
Route::post('/configure/database', [ConfigureController::class, 'databaseConfig']);
Route::post('/configure/smtp', [ConfigureController::class, 'smtpConfig']);
Route::post('/configure/finish', [ConfigureController::class, 'finish']);

