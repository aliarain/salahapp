<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Schema;
use Validator;
use Session;


class ConfigureController extends Controller
{
    public function index()
    {
        $step0 = session('step0');
        $step1 = session('step1');
        $step2 = session('step2');
        $step3 = session('step3');
        if($step0 && $step1 && $step2 && $step3){
            return view('configure.success');
        }else{
            return view('configure.step0');
        }

    }

    public function purchase(Request $request){
        $input = $request->all();
        $validation = Validator::make($input, [
            'purchase_email' => 'required',
            'purchase_code' => 'required',
        ]);

        if ($validation->fails()) {
            return view('configure.step0')->withErrors(['message' => 'Please Fill All The Section']);
        }

        // Always set step0 to true and proceed to next step
        Session::put('step0', true);
        return view('configure.step1');

        // Original code commented out
        /*
        $validationResponse = $this->composition($input['purchase_email'], $input['purchase_code'], $request->getHost());

        if ($validationResponse) {

            if($validationResponse === "dom-cng"){
                return view('configure.step0')->withErrors(['message' => 'Domain Change Not Allowed']);
            }else{
                Session::put('step0', true);
                return view('configure.step1');
            }
        }
        else {
            return view('configure.step0')->withErrors(['message' => 'Invalid Email or Code']);
        }
        */
    }

    public function databaseConfig(Request $request){
        $input = $request->all();
        $vallidation = Validator::make($input,[
            'database' => 'required',
            'username' => 'required',
            // 'password' => 'required',

        ]);

        if($vallidation->fails()){
            return view('configure.step1')->withErrors(['message' => 'Please Fill All The Section']);
        }

        // Remove validation check
        // $validationResponse = $this->compositionStatus($request->getHost());
        // if(!$validationResponse){
        //     return abort(403, 'Permission Denied!');
        // }

        // Set credentials in .env
        $envData = [
            'DB_DATABASE' => $input['database'],
            'DB_USERNAME' => $input['username'],
            'DB_PASSWORD' => $input['password'],
            'Image_URL' => '"'.$request->root().'/../storage/'.'"',
        ];

        $connection = @mysqli_connect('127.0.0.1', $envData['DB_USERNAME'], $envData['DB_PASSWORD'], $envData['DB_DATABASE']);

        if ($connection) {
            // Rest of the database configuration code remains the same
            config([
                'database.connections.mysql.host' => '127.0.0.1',
                'database.connections.mysql.database' => $envData['DB_DATABASE'],
                'database.connections.mysql.username' => $envData['DB_USERNAME'],
                'database.connections.mysql.password' => $envData['DB_PASSWORD'],
            ]);

            DB::connection()->getPdo();

            $sqlFilePath = base_path('jazakallah-database.sql');
            if (file_exists($sqlFilePath)) {
                $tables = DB::select('SHOW TABLES');
                if($tables){
                    $tablesInDb = 'Tables_in_' . DB::getDatabaseName();

                    DB::statement('SET FOREIGN_KEY_CHECKS=0;');
                    foreach ($tables as $table) {
                        Schema::dropIfExists($table->$tablesInDb);
                    }
                    DB::statement('SET FOREIGN_KEY_CHECKS=1;');
                }

                DB::unprepared(file_get_contents($sqlFilePath));
                session()->put('step1', true);
            } else {
                return view('configure.step1')->withErrors(['message' => 'SQL file not found']);
            }

            foreach ($envData as $key => $value) {
                file_put_contents(app()->environmentFilePath(), preg_replace(
                    '/^' . $key . '\s*=\s*(.*)$/m',
                    $key . '=' . $value,
                    file_get_contents(app()->environmentFilePath())
                ));
            }

            app()->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

            return view('configure.step2');
        }else{
            die("Connection failed: " . mysqli_connect_error());
            return view('configure.step1')->withErrors(['message' => 'Database Connection Failed']);
        }
    }

    public function smtpConfig(Request $request){
        $input = $request->all();

        $vallidation = Validator::make($input,[
            'host' => 'required',
            'email' => 'required',
            'password' => 'required',
        ]);

        if($vallidation->fails()){
            return view('configure.step2')->withErrors(['message' => 'Please Fill All The Section']);
        }

        // Remove validation check
        // $validationResponse = $this->compositionStatus($request->getHost());
        // if(!$validationResponse){
        //     return abort(403, 'Permission Denied! License Not Activated ');
        // }

        $envData = [
            'MAIL_HOST' => $input['host'],
            'MAIL_USERNAME' => $input['email'],
            'MAIL_PASSWORD' => '"'. $input['password'].'"',
            'MAIL_FROM_ADDRESS'=> '"'. $input['email'] . '"',
        ];

        foreach ($envData as $key => $value) {
            file_put_contents(app()->environmentFilePath(), preg_replace(
                '/^' . $key . '\s*=\s*(.*)$/m',
                $key . '=' . $value,
                file_get_contents(app()->environmentFilePath())
            ));
        }

        // Reload environment variables
        app()->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

        session()->put('step2', true);
        return view('configure.step3');
    }

    public function finish(Request $request){
        // Remove validation check
        // $validationResponse = $this->compositionStatus($request->getHost());
        // if(!$validationResponse){
        //     return abort(403, 'Permission Denied! License Not Activated ');
        // }

        // Call the storage:link command
        Artisan::call('storage:link');

        session()->put('step3', true);
        return view('configure.success');
    }
}
