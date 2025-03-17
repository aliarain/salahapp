<?php

namespace App\Http\Controllers;

use App\Models\HadithCategory;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;

class HadithCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $category = HadithCategory::all();
        if($category){
            return response()->json($category);
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
            'categoryArabic' => 'required',
            'categoryEnglish' => 'required',
            'categoryTurkish' => 'required',
            'categoryUrdu' => 'required',
            'categoryBangla' => 'required',
            'categoryHindi' => 'required',
            'categoryFrench' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;

        

        $category = new HadithCategory();
        $category->categoryArabic = $data['categoryArabic'];
        $category->categoryEnglish = $data['categoryEnglish'];
        $category->categoryTurkish = $data['categoryTurkish'];
        $category->categoryUrdu = $data['categoryUrdu'];
        $category->categoryBangla = $data['categoryBangla'];
        $category->categoryHindi = $data['categoryHindi'];
        $category->categoryFrench = $data['categoryFrench'];
        $category->_id = strval($_id);
        $category->timestamp = $timestamp;

        if($category->save()){
            return response()->json($category, 201);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\HadithCategory  $hadithCategory
     * @return \Illuminate\Http\Response
     */
    public function show($category_id)
    {
        $category = HadithCategory::where('_id', $category_id)->first();
        if($category){
            return response()->json($category, 200);
        }else{
            return response()->json(["message" => "Invalid ObjectId"], 400);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\HadithCategory  $hadithCategory
     * @return \Illuminate\Http\Response
     */
    public function edit(HadithCategory $hadithCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\HadithCategory  $hadithCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $category_id)
    {
        $category = HadithCategory::where('_id', $category_id)->first();

        $input = $request->all();


        $dataVallidation = Validator::make($input,[
            'data' => 'required',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $category->categoryArabic = $data['categoryArabic'];
        $category->categoryEnglish = $data['categoryEnglish'];
        $category->categoryTurkish = $data['categoryTurkish'];
        $category->categoryUrdu = $data['categoryUrdu'];
        $category->categoryBangla = $data['categoryBangla'];
        $category->categoryHindi = $data['categoryHindi'];
        $category->categoryFrench = $data['categoryFrench'];

        if($category->save()){
            return response()->json($category, 200);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\HadithCategory  $hadithCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy($category_id)
    {
        $category = HadithCategory::where('_id', $category_id)->first();

        if($category){
            $category->delete();
            return response()->json(["message" => "Deleted Successfully"], 200);
        }else{
            return response()->json(["message" => "no hadith category found with this id!"], 400);
        }
    }
}
