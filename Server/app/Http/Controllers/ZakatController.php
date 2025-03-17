<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Zakat;
use Validator;
use Carbon\Carbon;

class ZakatController extends Controller
{
    public function zakatCreateUpdate(Request $request){
            $input = $request->all();

            $dataVallidation = Validator::make($input,[
                'data' => 'required|json',
            ]);

            if($dataVallidation->fails()){
                return response()->json(['error' => $dataVallidation->errors()],422);
            }


            $data = json_decode($request->data, true);

            $vallidation = Validator::make($data,[
                'USD' => 'required',
                'BDT' => 'required',
                'INR' => 'required',
                'PKR' => 'required',
                'TRY' => 'required',
                'IDR' => 'required',
                'MYR' => 'required',
                'SAR' => 'required',
            ]);

            if($vallidation->fails()){
                return response()->json(['error' => $vallidation->errors()],422);
            }

            // dd($data);

            $zakat = Zakat::where('zakatId', 1)->first();

            // dd($zakat);

            if($zakat){
                $zakat->USD = $data['USD'];
                $zakat->BDT = $data['BDT'];
                $zakat->INR = $data['INR'];
                $zakat->PKR = $data['PKR'];
                $zakat->IDR = $data['IDR'];
                $zakat->TRY = $data['TRY'];
                $zakat->MYR = $data['MYR'];
                $zakat->SAR = $data['SAR'];

                if($zakat->save()){
                    return response()->json($zakat);
                }

            }else{

                $_id = Carbon::now()->getTimestampMs();
                $timestamp = Carbon::now()->timestamp;
                
                $zakat = new Zakat();
                $zakat->USD = $data['USD'];
                $zakat->BDT = $data['BDT'];
                $zakat->INR = $data['INR'];
                $zakat->PKR = $data['PKR'];
                $zakat->IDR = $data['IDR'];
                $zakat->TRY = $data['TRY'];
                $zakat->MYR = $data['MYR'];
                $zakat->SAR = $data['SAR'];
                $zakat->_id =  strval($_id);
                $zakat->timestamp = $timestamp;
                $zakat->zakatId = 1;

                if($zakat->save()){
                    return response()->json($zakat); 
                }
            }
    
    }

    public function index(){
        $zakat = Zakat::where('zakatId', 1)->first();
        if($zakat){
            return response()->json($zakat);
        }else{
            return response()->json(["message" => "No Zakat Data Found"]); 
        }
    }

    public function destroy(){
        $zakat = Zakat::where('zakatId', 1)->first();
        if($zakat->delete()){
            return response()->json(["message" => "Zakat Details Delete Successfully"], 200); 
        }else{
            return response()->json(["message" => "No Zakat Details Found"], 404); 
        }

    }


}
