<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClothingItemController;

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

// Authentication routes (Optional, can be removed if not needed)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);

// Clothing Items routes (All Public)
Route::get('/clothing-items', [ClothingItemController::class, 'index']); // Get all clothing items
Route::post('/clothing-items', [ClothingItemController::class, 'store']); // Add a clothing item
Route::get('/clothing-items/{id}', [ClothingItemController::class, 'show']); // Get a single clothing item
Route::put('/clothing-items/{id}', [ClothingItemController::class, 'update']); // Update a clothing item
Route::delete('/clothing-items/{id}', [ClothingItemController::class, 'destroy']); // Delete a clothing item
