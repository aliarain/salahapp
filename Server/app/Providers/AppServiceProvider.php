<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //public function boot()
{
    // Set default string length for MySQL
    \Illuminate\Database\Schema\Builder::defaultStringLength(191);

        // Set UTF-8 encoding
        \DB::statement('SET NAMES utf8mb4');
        \DB::statement('SET CHARACTER SET utf8mb4');
        \DB::statement('SET SESSION collation_connection = utf8mb4_unicode_ci');

    }
}
}