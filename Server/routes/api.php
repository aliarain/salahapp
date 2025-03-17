<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HadithCategoryController;
use App\Http\Controllers\HadithController;
use App\Http\Controllers\DuaCategoryController;
use App\Http\Controllers\DuaController;
use App\Http\Controllers\AzkarCategoryController;
use App\Http\Controllers\AzkarController;
use App\Http\Controllers\WallpaperController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ZakatController;
use App\Http\Controllers\NotificationHistoryController;
use App\Http\Controllers\LiveLinkController;
use App\Http\Controllers\MasjidController;
use App\Http\Controllers\PrayerTimeController;













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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Admin
Route::post('/admins/register', [AdminController::class, 'register']);
Route::post('/admins/login', [AdminController::class, 'login']);
Route::get('/admins/find/{admin_id}', [AdminController::class, 'show']);
Route::get('/admins/all', [AdminController::class, 'index']);
Route::post('/admins/send-otp', [AdminController::class, 'sendOTP']);
Route::post('/admins/validate-otp', [AdminController::class, 'ValidateOTP']);
Route::post('/admins/reset', [AdminController::class, 'resetPass']);
Route::post('/admins/update/{admin_id}', [AdminController::class, 'updateAdmin']);
Route::delete('/admins/delete/{admin_id}', [AdminController::class, 'deleteAdmin']);

//User
Route::post('/users/register', [UserController::class, 'register']);
Route::post('/users/login', [UserController::class, 'login']);
Route::get('/users/find/{user_id}', [UserController::class, 'show']);
Route::get('/users/all', [UserController::class, 'index']);
Route::post('/users/send-otp', [UserController::class, 'sendOTP']);
Route::post('/users/validate-otp', [UserController::class, 'ValidateOTP']);
Route::post('/users/reset', [UserController::class, 'resetPass']);
Route::post('/users/update/{user_id}', [UserController::class, 'updateUser']);
Route::post('/users/update-donation/{user_id}', [UserController::class, 'updateDonation']);
Route::delete('/users/delete/{user_id}', [UserController::class, 'deleteUser']);


//Hadith Category
Route::post('/hadith-categories/add', [HadithCategoryController::class, 'store']);
Route::get('/hadith-categories/all', [HadithCategoryController::class, 'index']);
Route::get('/hadith-categories/find/{category_id}', [HadithCategoryController::class, 'show']);
Route::post('/hadith-categories/update/{category_id}', [HadithCategoryController::class, 'update']);
Route::delete('/hadith-categories/delete/{category_id}', [HadithCategoryController::class, 'destroy']);


//Hadith
Route::post('/hadiths/add', [HadithController::class, 'store']);
Route::get('/hadiths/all', [HadithController::class, 'index']);
Route::get('/hadiths/find/{hadith_id}', [HadithController::class, 'show']);
Route::post('/hadiths/update/{hadith_id}', [HadithController::class, 'update']);
Route::delete('/hadiths/delete/{hadith_id}', [HadithController::class, 'destroy']);
Route::get('/hadiths/category/{category_id}', [HadithController::class, 'categoryWise']);


//Dua Category
Route::post('/dua-categories/add', [DuaCategoryController::class, 'store']);
Route::get('/dua-categories/all', [DuaCategoryController::class, 'index']);
Route::get('/dua-categories/find/{category_id}', [DuaCategoryController::class, 'show']);
Route::post('/dua-categories/update/{category_id}', [DuaCategoryController::class, 'update']);
Route::delete('/dua-categories/delete/{category_id}', [DuaCategoryController::class, 'destroy']);


//Dua
Route::post('/duas/add', [DuaController::class, 'store']);
Route::get('/duas/all', [DuaController::class, 'index']);
Route::get('/duas/find/{dua_id}', [DuaController::class, 'show']);
Route::post('/duas/update/{dua_id}', [DuaController::class, 'update']);
Route::delete('/duas/delete/{dua_id}', [DuaController::class, 'destroy']);
Route::get('/duas/category/{category_id}', [DuaController::class, 'categoryWise']);

//Azkar Categroy
Route::post('/azkar-categories/add', [AzkarCategoryController::class, 'store']);
Route::get('/azkar-categories/all', [AzkarCategoryController::class, 'index']);
Route::get('/azkar-categories/find/{category_id}', [AzkarCategoryController::class, 'show']);
Route::post('/azkar-categories/update/{category_id}', [AzkarCategoryController::class, 'update']);
Route::delete('/azkar-categories/delete/{category_id}', [AzkarCategoryController::class, 'destroy']);


//Azkar
Route::post('/azkars/add', [AzkarController::class, 'store']);
Route::get('/azkars/all', [AzkarController::class, 'index']);
Route::get('/azkars/find/{azkar_id}', [AzkarController::class, 'show']);
Route::post('/azkars/update/{azkar_id}', [AzkarController::class, 'update']);
Route::delete('/azkars/delete/{azkar_id}', [AzkarController::class, 'destroy']);
Route::get('/azkars/category/{category_id}', [AzkarController::class, 'categoryWise']);

//WallPaper
Route::post('/wallpapers/add', [WallpaperController::class, 'store']);
Route::get('/wallpapers/all', [WallpaperController::class, 'index']);
Route::get('/wallpapers/find/{wallpaper_id}', [WallpaperController::class, 'show']);
Route::post('/wallpapers/update/{wallpaper_id}', [WallpaperController::class, 'update']);
Route::delete('/wallpapers/delete/{wallpaper_id}', [WallpaperController::class, 'destroy']);


//Zakat
Route::post('/zakats/add', [ZakatController::class, 'zakatCreateUpdate']);
Route::get('/zakats/find', [ZakatController::class, 'index']);
Route::delete('/zakats/delete', [ZakatController::class, 'destroy']);

//Notification History
Route::get('/fetch_notification_history', [NotificationHistoryController::class, 'index']);
Route::post('/create_notification_history', [NotificationHistoryController::class, 'store']);
Route::delete('/notification_history/{notification_id}', [NotificationHistoryController::class, 'destroy']);


//Live Link
Route::get('/link', [LiveLinkController::class, 'index']);
Route::post('/link', [LiveLinkController::class, 'store']);

// Masjid routes
Route::get('/masjids', [MasjidController::class, 'index']);
Route::get('/masjids/{id}', [MasjidController::class, 'show']);
Route::post('/masjids', [MasjidController::class, 'store']);
Route::put('/masjids/{id}', [MasjidController::class, 'update']);
Route::delete('/masjids/{id}', [MasjidController::class, 'destroy']);
Route::get('/nearby-masjids', [MasjidController::class, 'nearby']);

// Prayer time routes
Route::get('/prayer-times', [PrayerTimeController::class, 'index']);
Route::get('/prayer-times/{id}', [PrayerTimeController::class, 'show']);
Route::post('/prayer-times', [PrayerTimeController::class, 'store']);
Route::put('/prayer-times/{id}', [PrayerTimeController::class, 'update']);
Route::delete('/prayer-times/{id}', [PrayerTimeController::class, 'destroy']);
Route::post('/process-timetable', [PrayerTimeController::class, 'processTimetable']);
Route::get('/masjids/{masjidId}/prayer-times', [PrayerTimeController::class, 'getMasjidPrayerTimes']);