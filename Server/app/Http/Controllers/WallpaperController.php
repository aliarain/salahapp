<?php

namespace App\Http\Controllers;

use App\Models\Wallpaper;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Storage;
use \Str;

class WallpaperController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $wallpaper = Wallpaper::all();
        if($wallpaper){
            return response()->json($wallpaper, 200);
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
            'file' => 'required|image'
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'wallpaperName' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;

        $wallpapers = new Wallpaper();
        $wallpapers->wallpaperName = $data['wallpaperName'];
        $wallpapers->_id = strval($_id);
        $wallpapers->timestamp = $timestamp;

        if ($request->hasFile('file')) {
            $wallpaper = $request->file('file');
            $wallpaperFilename = 'wallpaper_' . time() . '.' . $wallpaper->getClientOriginalExtension();
            $wallpaperPath = 'public/wallpaper_images/' . $wallpaperFilename;
            $wallpaperImage = Image::make($wallpaper);
            $wallpaperImage->save(storage_path('app/' . $wallpaperPath), 100);
        }

        if (isset($wallpaperPath)) {
            $tempLink = explode('public/', $wallpaperPath);
            $wallpapers->originalUrl = trim(env('Image_URL')).$tempLink[1];
        }


        if ($request->hasFile('file')) {
            $thumbnail = $request->file('file');
            $thumbnailFilename = 'thumbnail_' . time() . '.' . $thumbnail->getClientOriginalExtension();
            $thumbnailPath = 'public/thumbnail_images/' . $thumbnailFilename;
            $thumbnailImage = Image::make($thumbnail);
            $thumbnailImage->save(storage_path('app/' . $thumbnailPath), 30);
        }

        if (isset($thumbnailPath)) {
            $tempLink = explode('public/', $thumbnailPath);
            $wallpapers->thumbnailUrl = trim(env('Image_URL')).$tempLink[1];
        }
        

        if($wallpapers->save()){
            return response()->json($wallpapers, 201);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Wallpaper  $wallpaper
     * @return \Illuminate\Http\Response
     */
    public function show($wallpaper_id)
    {
        $wallpaper = Wallpaper::where('_id', $wallpaper_id)->first();

        if($wallpaper){
            return response()->json($wallpaper, 200);
        }else{
            return response()->json(["message" => "no Wallpaper found with this id!"], 400);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Wallpaper  $wallpaper
     * @return \Illuminate\Http\Response
     */
    public function edit(Wallpaper $wallpaper)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Wallpaper  $wallpaper
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $wallpaper_id)
    {
        $wallpaper = Wallpaper::where('_id', $wallpaper_id)->first();

        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
            'file' => 'required|image'
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'wallpaperName' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $wallpaper->wallpaperName = $data['wallpaperName'];
       
        if($request->hasFile('file')){
            
            $tempLinkWallpaper = explode(trim(env('Image_URL')), $wallpaper->originalUrl);
            Storage::delete('public/'.$tempLinkWallpaper[1]);
            
            $imageFile = $request->file('file');
            $optimizeImage = Image::make($imageFile);
            $imageFilename = 'wallpaper_' . time() . '.' . $imageFile->getClientOriginalExtension();
            $imagePath = 'public/wallpaper_images/' . $imageFilename;
            $optimizeImage->save(storage_path('app/' . $imagePath), 100);
        
        }

        if($request->hasFile('file')){
            $tempLinkThumbnail = explode(trim(env('Image_URL')), $wallpaper->thumbnailUrl);
            Storage::delete('public/'.$tempLinkThumbnail[1]);

            $thumbnailFile = $request->file('file');
            $optimizethumbnail = Image::make($thumbnailFile);
            $thumbnailFilename = 'thumbnail_' . time() . '.' . $thumbnailFile->getClientOriginalExtension();
            $thumbnailPath = 'public/thumbnail_images/' . $thumbnailFilename;
            $optimizethumbnail->save(storage_path('app/' . $thumbnailPath), 30);
        }

        if (isset($imagePath)) {
            $tempLinkImage = explode('public/', $imagePath);
            $wallpaper->originalUrl = trim(env('Image_URL')).$tempLinkImage[1];
        }

        if (isset($thumbnailPath)) {
            $tempLinkThumbnail = explode('public/', $thumbnailPath);
            $wallpaper->thumbnailUrl = trim(env('Image_URL')).$tempLinkThumbnail[1];
        }

        if($wallpaper->save()){
            return response()->json($wallpaper);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Wallpaper  $wallpaper
     * @return \Illuminate\Http\Response
     */
    public function destroy($wallpaper_id)
    {
        $wallpaper = Wallpaper::where('_id', $wallpaper_id)->first();

        if($wallpaper){
            $tempLinkWallpaper = explode(trim(env('Image_URL')), $wallpaper->originalUrl);
            Storage::delete('public/'.$tempLinkWallpaper[1]);

            $tempLinkThumbnail = explode(trim(env('Image_URL')), $wallpaper->thumbnailUrl);
            Storage::delete('public/'.$tempLinkThumbnail[1]);

            $wallpaper->delete();
            return response()->json(["message" => "Deleted Successfully"], 200);
        }else{
            return response()->json(["message" => "no Dua found with this id!"], 400);
        }
    }
}
