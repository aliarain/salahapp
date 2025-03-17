<?php

namespace App\Http\Controllers;

use App\Models\Azkar;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;

class AzkarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $azkar = Azkar::select('azkars.*', 'azkar_categories.categoryArabic', 'azkar_categories.categoryEnglish', 'azkar_categories.categoryTurkish', 'azkar_categories.categoryUrdu')->join('azkar_categories', 'azkar_categories._id', '=', 'azkars.category_id')->get();
        
        if($azkar){
            return response()->json($azkar);
        }else{
            return response()->json(["message" => "Invalid ObjectId"], 400);
        }
    }

    public function categoryWise($category_id){
        $azkar = Azkar::select('azkars.*', 'azkar_categories.categoryArabic', 'azkar_categories.categoryEnglish', 'azkar_categories.categoryTurkish', 'azkar_categories.categoryUrdu')->join('azkar_categories', 'azkar_categories._id', '=', 'azkars.category_id')->where('azkars.category_id', $category_id)->get();
        
        if($azkar){
            return response()->json($azkar);
        }else{
            return response()->json(["message" => "Invalid ObjectId"], 400);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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
            'azkarEnglish' => 'required',
            'azkarArabic' => 'required',
            'azkarTurkish' => 'required',
            'azkarUrdu' => 'required',
            'azkarBangla' => 'required',
            'azkarHindi' => 'required',
            'azkarFrench' => 'required',
            'category_id' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;

        

        $azkar = new Azkar();
        $azkar->azkarEnglish = $data['azkarEnglish'];
        $azkar->azkarArabic = $data['azkarArabic'];
        $azkar->azkarTurkish = $data['azkarTurkish'];
        $azkar->azkarUrdu = $data['azkarUrdu'];
        $azkar->azkarBangla = $data['azkarBangla'];
        $azkar->azkarHindi = $data['azkarHindi'];
        $azkar->azkarFrench = $data['azkarFrench'];
        $azkar->category_id = $data['category_id'];
        $azkar->_id = strval($_id);
        $azkar->timestamp = $timestamp;

        if($azkar->save()){
            return response()->json($azkar, 201);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Azkar  $azkar
     * @return \Illuminate\Http\Response
     */
    public function show($azkar_id)
    {
        
        $azkar = Azkar::where('_id', $azkar_id)->first();
      
        if($azkar){
            return response()->json($azkar, 200);
        }else{
            return response()->json(["message" => "no Azkar found with this id!"], 400);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Azkar  $azkar
     * @return \Illuminate\Http\Response
     */
    public function edit(Azkar $azkar)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Azkar  $azkar
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $azkar_id)
    {
        $azkar = Azkar::where('_id', $azkar_id)->first();

        $input = $request->all();


        $dataVallidation = Validator::make($input,[
            'data' => 'required',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }



        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'azkarEnglish' => 'required',
            'azkarArabic' => 'required',
            'azkarTurkish' => 'required',
            'azkarUrdu' => 'required',
            'azkarBangla' => 'required',
            'azkarHindi' => 'required',
            'azkarFrench' => 'required',
            'category_id' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $azkar->azkarEnglish = $data['azkarEnglish'];
        $azkar->azkarArabic = $data['azkarArabic'];
        $azkar->azkarTurkish = $data['azkarTurkish'];
        $azkar->azkarUrdu = $data['azkarUrdu'];
        $azkar->azkarBangla = $data['azkarBangla'];
        $azkar->azkarHindi = $data['azkarHindi'];
        $azkar->azkarFrench = $data['azkarFrench'];
        $azkar->category_id = $data['category_id'];

        if($azkar->save()){
            return response()->json($azkar, 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Azkar  $azkar
     * @return \Illuminate\Http\Response
     */
    public function destroy($azkar_id)
    {
        $azkar = Azkar::where('_id', $azkar_id)->first();

        if($azkar){
            $azkar->delete();
            return response()->json(["message" => "Deleted Successfully"], 200);
        }else{
            return response()->json(["message" => "no Dua found with this id!"], 400);
        }
    }
}
