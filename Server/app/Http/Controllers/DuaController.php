<?php namespace App\Http\Controllers;

use App\Models\Dua;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;

class DuaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dua = Dua::select('duas.*', 'dua_categories.categoryArabic', 'dua_categories.categoryEnglish', 'dua_categories.categoryTurkish', 'dua_categories.categoryUrdu')->join('dua_categories', 'dua_categories._id', '=', 'duas.category_id')->get();

        if($dua){
            return response()->json($dua, 200);
        }else{
            return response()->json(["message" => "Invalid ObjectId"], 400);
        }
    }

    public function categoryWise($category_id){
        $dua = Dua::select('duas.*', 'dua_categories.categoryArabic', 'dua_categories.categoryEnglish', 'dua_categories.categoryTurkish', 'dua_categories.categoryUrdu')->join('dua_categories', 'dua_categories._id', '=', 'duas.category_id')->where('duas.category_id', $category_id)->get();
        if($dua){
            return response()->json($dua);
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
            'duaArabic' => 'required',
            'duaEnglish' => 'required',
            'duaTurkish' => 'required',
            'duaUrdu' => 'required',
            'duaBangla' => 'required',
            'duaHindi' => 'required',
            'duaFrench' => 'required',
            'titleArabic' => 'required',
            'titleEnglish' => 'required',
            'titleTurkish' => 'required',
            'titleUrdu' => 'required',
            'titleBangla' => 'required',
            'titleHindi' => 'required',
            'titleFrench' => 'required',
            'category_id' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;



        $hadith = new Dua();
        $hadith->duaArabic = $data['duaArabic'];
        $hadith->duaEnglish = $data['duaEnglish'];
        $hadith->duaTurkish = $data['duaTurkish'];
        $hadith->duaBangla = $data['duaBangla'];
        $hadith->duaHindi = $data['duaHindi'];
        $hadith->duaFrench = $data['duaFrench'];
        $hadith->duaUrdu = $data['duaUrdu'];
        $hadith->titleArabic = $data['titleArabic'];
        $hadith->titleTurkish = $data['titleTurkish'];
        $hadith->titleUrdu = $data['titleUrdu'];
        $hadith->titleEnglish = $data['titleEnglish'];
        $hadith->titleBangla = $data['titleBangla'];
        $hadith->titleHindi = $data['titleHindi'];
        $hadith->titleFrench = $data['titleFrench'];
        $hadith->category_id = $data['category_id'];
        $hadith->_id = strval($_id);
        $hadith->timestamp = $timestamp;

        if($hadith->save()){
            return response()->json($hadith, 201);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Dua  $dua
     * @return \Illuminate\Http\Response
     */
    public function show($dua_id)
    {
        $dua = Dua::where('_id', $dua_id)->first();
        if($dua){
            return response()->json($dua, 200);
        }else{
            return response()->json(["message" => "no Dua found with this id!"], 400);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Dua  $dua
     * @return \Illuminate\Http\Response
     */
    public function edit($dua_id)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Dua  $dua
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $dua_id)
    {
        $dua = Dua::where('_id', $dua_id)->first();

        $input = $request->all();


        $dataVallidation = Validator::make($input,[
            'data' => 'required',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }



        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'duaArabic' => 'required',
            'duaEnglish' => 'required',
            'duaTurkish' => 'required',
            'duaBangla' => 'required',
            'duaHindi' => 'required',
            'duaFrench' => 'required',
            'duaUrdu' => 'required',
            'titleArabic' => 'required',
            'titleEnglish' => 'required',
            'titleTurkish' => 'required',
            'titleUrdu' => 'required',
            'titleBangla' => 'required',
            'titleHindi' => 'required',
            'titleFrench' => 'required',
            'category_id' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $dua->duaArabic = $data['duaArabic'];
        $dua->duaEnglish = $data['duaEnglish'];
        $dua->duaTurkish = $data['duaTurkish'];
        $dua->duaUrdu = $data['duaUrdu'];
        $dua->duaBangla = $data['duaBangla'];
        $dua->duaHindi = $data['duaHindi'];
        $dua->duaFrench = $data['duaFrench'];
        $dua->titleArabic = $data['titleArabic'];
        $dua->titleTurkish = $data['titleTurkish'];
        $dua->titleUrdu = $data['titleUrdu'];
        $dua->titleBangla = $data['titleBangla'];
        $dua->titleHindi = $data['titleHindi'];
        $dua->titleFrench = $data['titleFrench'];
        $dua->titleEnglish = $data['titleEnglish'];
        $dua->category_id = $data['category_id'];

        if($dua->save()){
            return response()->json($dua, 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Dua  $dua
     * @return \Illuminate\Http\Response
     */
    public function destroy($dua_id)
    {
        $dua = Dua::where('_id', $dua_id)->first();

        if($dua){
            $dua->delete();
            return response()->json(["message" => "Deleted Successfully"], 200);
        }else{
            return response()->json(["message" => "no Dua found with this id!"], 400);
        }
    }
}
