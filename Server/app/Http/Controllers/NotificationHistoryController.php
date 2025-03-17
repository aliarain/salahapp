<?php

namespace App\Http\Controllers;

use App\Models\NotificationHistory;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;
use Intervention\Image\Facades\Image;
use Storage;

class NotificationHistoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $history = NotificationHistory::all();

        return response()->json($history);
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
            'title' => 'required',
            'message' => 'required',
            'user_type' => 'required',

        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;


        $history = new NotificationHistory();
        $history->title = $data['title'];
        $history->message = $data["message"];
        $history->user_type = $data['user_type'];
        $history->_id = $_id;
        $history->timestamp = $timestamp;

        if ($request->hasFile('image')) {
            
            $imageFile = $request->file('image');
            $optimizeImage = Image::make($imageFile);
            $imageFilename = 'notification_' . time() . '.' . $imageFile->getClientOriginalExtension();
            $imagePath = 'public/notification_images/' . $imageFilename;

            $optimizeImage->save(storage_path('app/' . $imagePath), 30);
        }

        if (isset($imagePath)) {
            $tempLink = explode('public/', $imagePath);
                   
            $history->image = trim(env('Image_URL')).$tempLink[1];
        }

        if($history->save()){
            return response()->json($history);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NotificationHistory  $notificationHistory
     * @return \Illuminate\Http\Response
     */
    public function show(NotificationHistory $notificationHistory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\NotificationHistory  $notificationHistory
     * @return \Illuminate\Http\Response
     */
    public function edit(NotificationHistory $notificationHistory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NotificationHistory  $notificationHistory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NotificationHistory $notificationHistory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NotificationHistory  $notificationHistory
     * @return \Illuminate\Http\Response
     */
    public function destroy($notification_id)
    {
        $noti = NotificationHistory::where('_id', $notification_id)->first();

        if($noti){
            $tempLink = explode(trim(env('Image_URL')), $noti->image);
            Storage::delete('public/'.$tempLink[1]);

            if($noti->delete()){
                return response()->json(["message" => "Delete Successfully"], 200);
            }
        }else{
            return response()->json(["message" => "Notification not found!"], 404);
        }

    }
}
