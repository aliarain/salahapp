<?php

namespace App\Http\Controllers;

use App\Models\Hadith;
use App\Models\HadithCategory;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;

class HadithController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $hadith = Hadith::all();
        $hadith = Hadith::select('hadiths.*', 'hadith_categories.categoryArabic', 'hadith_categories.categoryEnglish', 'hadith_categories.categoryTurkish', 'hadith_categories.categoryUrdu')->join('hadith_categories', 'hadith_categories._id', '=', 'hadiths.category_id')->get();
        
        if($hadith){
            return response()->json($hadith);
        }else{
            return response()->json(["message" => "Invalid ObjectId"], 400);
        }
    }

    public function categoryWise($category_id){
        $hadith = Hadith::select('hadiths.*', 'hadith_categories.categoryArabic', 'hadith_categories.categoryEnglish', 'hadith_categories.categoryTurkish', 'hadith_categories.categoryUrdu')->join('hadith_categories', 'hadith_categories._id', '=', 'hadiths.category_id')->where('hadiths.category_id', $category_id)->get();
        if($hadith){
            return response()->json($hadith);
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
            'narratedBy' => 'required',
            'referenceBook' => 'required',
            'category_id' => 'required',
            'hadithArabic' => 'required',
            'hadithEnglish' => 'required',
            'hadithTurkish' => 'required',
            'hadithUrdu' => 'required',
            'hadithBangla' => 'required',
            'hadithHindi' => 'required',
            'hadithFrench' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;

        

        $hadith = new Hadith();
        $hadith->narratedBy = $data['narratedBy'];
        $hadith->referenceBook = $data['referenceBook'];
        $hadith->category_id = $data['category_id'];
        $hadith->hadithArabic = $data['hadithArabic'];
        $hadith->hadithEnglish = $data['hadithEnglish'];
        $hadith->hadithTurkish = $data['hadithTurkish'];
        $hadith->hadithUrdu = $data['hadithUrdu'];
        $hadith->hadithBangla = $data['hadithBangla'];
        $hadith->hadithHindi = $data['hadithHindi'];
        $hadith->hadithFrench = $data['hadithFrench'];
        $hadith->_id = strval($_id);
        $hadith->timestamp = $timestamp;

        if($hadith->save()){
            return response()->json($hadith, 201);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Hadith  $hadith
     * @return \Illuminate\Http\Response
     */
    public function show($hadith_id)
    {
        $hadith = Hadith::where('_id', $hadith_id)->first();
        if($hadith){
            return response()->json($hadith, 200);
        }else{
            return response()->json(["message" => "Invalid ObjectId"], 400);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Hadith  $hadith
     * @return \Illuminate\Http\Response
     */
    public function edit(Hadith $hadith)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Hadith  $hadith
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $hadith_id)
    {
        $hadith = Hadith::where('_id', $hadith_id)->first();

        $input = $request->all();


        $dataVallidation = Validator::make($input,[
            'data' => 'required',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }



        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'narratedBy' => 'required',
            'referenceBook' => 'required',
            'category_id' => 'required',
            'hadithArabic' => 'required',
            'hadithEnglish' => 'required',
            'hadithTurkish' => 'required',
            'hadithUrdu' => 'required',
            'hadithBangla' => 'required',
            'hadithHindi' => 'required',
            'hadithFrench' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $hadith->narratedBy = $data['narratedBy'];
        $hadith->referenceBook = $data['referenceBook'];
        $hadith->category_id = $data['category_id'];
        $hadith->hadithArabic = $data['hadithArabic'];
        $hadith->hadithEnglish = $data['hadithEnglish'];
        $hadith->hadithTurkish = $data['hadithTurkish'];
        $hadith->hadithUrdu = $data['hadithUrdu'];
        $hadith->hadithBangla = $data['hadithBangla'];
        $hadith->hadithHindi = $data['hadithHindi'];
        $hadith->hadithFrench = $data['hadithFrench'];

        if($hadith->save()){
            return response()->json($hadith, 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Hadith  $hadith
     * @return \Illuminate\Http\Response
     */
    public function destroy($hadith_id)
    {
        $hadith = Hadith::where('_id', $hadith_id)->first();

        if($hadith){
            $hadith->delete();
            return response()->json(["message" => "Deleted Successfully"], 200);
        }else{
            return response()->json(["message" => "no hadith found with this id!"], 400);
        }
    }
}
