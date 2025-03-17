<?php

namespace App\Http\Controllers;

use App\Models\LiveLink;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;

class LiveLinkController extends Controller
{
    
    public function index()
    {
        $liveLink = LiveLink::where('live_link_id', 1)->first();
        if($liveLink){
            return response()->json($liveLink, 200);
        }else{
            return response()->json(["message" => "Live link not found"], 409);
        }
    }

   
    public function store(Request $request)
    {
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'live_link' => 'required',
            
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }


        $liveLink = LiveLink::where('live_link_id', 1)->first();


        if($liveLink){
            $liveLink->live_link = $data['live_link'];
            

            if($liveLink->save()){
                return response()->json($liveLink);
            }

        }else{

            $_id = Carbon::now()->getTimestampMs();
            $timestamp = Carbon::now()->timestamp;
            
            $liveLink = new LiveLink();
            $liveLink->live_link = $data['live_link'];
            $liveLink->_id =  strval($_id);
            $liveLink->timestamp = $timestamp;
            $liveLink->live_link_id = 1;

            if($liveLink->save()){
                return response()->json($liveLink); 
            }
        }
    }

    
}
