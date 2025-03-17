<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Models\ProfileImage;
use App\Models\ForgetPass;
use App\Mail\ForgetPasswordMail;
use Illuminate\Support\Facades\Mail;
use Validator;
use Carbon\Carbon;
use Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Storage;

class AdminController extends Controller
{
    public function register(Request $request){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'fullName' => 'required',
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;

        $newUser = new Admin();
        $newUser->fullName = $data['fullName'];
        $newUser->email = $data['email'];
        $newUser->password = Hash::make($data['password']);
        
        
        $newUser->_id = strval($_id);
        $newUser->timestamp = $timestamp;

        if($newUser->save()){
            return response()->json(["newUser"=> $newUser], 201);
        }

        
    }

    public function login(Request $request){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        // dd($data);
        $user = Admin::where('email', $data['email'])->first();
        
        // dd($user);

        if($user){
            if(Hash::check($data['password'], $user->password)){
                

                return response()->json(["user"=> $user], 200);

                
            }
            else{
                return response()->json(["message" => "Credential not matched"], 404);
            }
        }else{
            return response()->json(["message" => "No Admin Found"], 404);
        }
    }

    public function show($user_id){
        $user = Admin::where('_id', $user_id)->first();
        
        $profileImg = ProfileImage::where('user_id', $user_id)->first();
        
        if($profileImg){
            $user->fileUrl = [
                "originalUrl" => $profileImg->originalUrl,
                "thumbnailUrl" => $profileImg->thumbnailUrl,
            ];
        }else{
            $user->fileUrl = "";
        }
        return response()->json($user);

    }

    

    public function index()
    {
        $users = Admin::all();

        foreach ($users as $user) {
            // Fetch profile image
            $profileImg = ProfileImage::where('user_id', $user->_id)->first();

            if ($profileImg) {
                $user->fileUrl = [
                    "originalUrl" => $profileImg->originalUrl,
                    "thumbnailUrl" => $profileImg->thumbnailUrl,
                ];
            } else {
                $user->fileUrl = "";
            }
        }

        return response()->json($users);
    }

    public function sendOTP(Request $request){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'email' => 'required|email',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $user = Admin::where('email', $data['email'])->First();
        

        if($user){
            $forgetPass = ForgetPass::where('email', $data['email'])->first();
            if($forgetPass){
                $timestamp = Carbon::now()->timestamp;
                $otp_code = rand(1000, 9999);
                
                $forgetPass->timestamp = $timestamp;
                $forgetPass->otp = $otp_code;
                $forgetPass->isVerified = 0;

                if($forgetPass->save()){
                    Mail::to($data['email'])->send(new ForgetPasswordMail($otp_code));
                    return response()->json(["message"=> "Password reset OTP sent successfully"], 200);
                }
            }else{
                $timestamp = Carbon::now()->timestamp;

                $otp_code = rand(1000, 9999);

                $forget = new ForgetPass();
                $forget->email = $data['email'];
                $forget->timestamp = $timestamp;
                $forget->otp = $otp_code;
                $forget->isVerified = 0;

                if($forget->save()){
                    Mail::to($data['email'])->send(new ForgetPasswordMail($otp_code));
                    return response()->json(["message"=> "Password reset OTP sent successfully"], 200);
                }
            }

            
        }else{
            return response()->json(["message"=> "User doesn't exists"], 401);
        }

    }


    public function ValidateOTP(Request $request){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'email' => 'required|email',
            'otp' => 'required|min:4'
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $forgetPass = ForgetPass::where('email', $data['email'])->first();

        if($forgetPass){
            if($forgetPass->otp == $data['otp']){
                $forgetPass->isVerified = true;
                if($forgetPass->save()){
                    return response()->json(["message" => "otp matched!"]);
                }
            }else{
                return response()->json(["message" => "otp not matched!"]);  
            }
        }else{
            return response()->json(["message" => "No user found!"]); 
        }
    }



    public function resetPass(Request $request){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'email' => 'required|email',
            'otp' => 'required|min:4',
            'newPassword' => 'required'
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $forgetPass = ForgetPass::where('email', $data['email'])->first();
        if($forgetPass){
            if($forgetPass->isVerified == 1){
                $user = Admin::where('email', $data['email'])->first();
                $user->password = Hash::make($data['newPassword']);
                if($user->save()){
                    $forgetPass->delete();
                    return response()->json(["message" => "Password change successfully"], 200);
                }
            }
        }else{
            return response()->json(["message" => "No request found"], 404);
        }
    }


    public function updateAdmin(Request $request, $user_id){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        
        $user = Admin::where('_id', $user_id)->first();

        $profileImg = ProfileImage::where('user_id', $user_id)->first();

        if($request->hasfile('file')){
            if($profileImg){
                if ($request->hasFile('file')) {
                    $tempLink = explode(trim(env('Image_URL')), $profileImg->thumbnailUrl);
                    Storage::delete('public/'.$tempLink[1]);
                   
                    $thumbnail = $request->file('file');
                    $thumbnailFilename = 'admin_thumbnail_image_' . time() . '.' . $thumbnail->getClientOriginalExtension();
                    $thumbnailPath = 'public/admin_thumbnail_images/' . $thumbnailFilename;
                    $thumbnailImage = Image::make($thumbnail);
                    $thumbnailImage->save(storage_path('app/' . $thumbnailPath), 30); 
                     
        
                    if(isset($thumbnailPath)){
                        $tempLink = explode('public/', $thumbnailPath);
                        $profileImg->thumbnailUrl = trim(env('Image_URL')).$tempLink[1];
                    }
                }
                if ($request->hasFile('file')) {
                    $tempLink = explode(trim(env('Image_URL')), $profileImg->originalUrl);
                    Storage::delete('public/'.$tempLink[1]);
                    $Original = $request->file('file');
                    $OriginalFilename = 'admin_original_image_' . time() . '.' . $Original->getClientOriginalExtension();
                    $OriginalPath = 'public/admin_original_images/' . $OriginalFilename;
                    $OriginalImage = Image::make($Original);
                    $OriginalImage->save(storage_path('app/' . $OriginalPath), 100); 
                    
                    if(isset($OriginalPath)){
                        $tempLink = explode('public/', $OriginalPath);
                       
                        $profileImg->originalUrl = trim(env('Image_URL')).$tempLink[1];
                    }
                }
                $profileImg->save();
    
            }else{
                
                $proImg = new ProfileImage();
    
                $timestamp = Carbon::now()->timestamp;
                
                
                if ($request->hasFile('file')) {
                    $thumbnail = $request->file('file');
                    $thumbnailFilename = 'admin_thumbnail_image_' . time() . '.' . $thumbnail->getClientOriginalExtension();
                    $thumbnailPath = 'public/admin_thumbnail_images/' . $thumbnailFilename;
                    $thumbnailImage = Image::make($thumbnail);
                    $thumbnailImage->save(storage_path('app/' . $thumbnailPath), 30);  
        
                    // dd($thumbnailPath);
                    if(isset($thumbnailPath)){
                        $tempLinkthumb = explode('public/', $thumbnailPath);
                        $proImg->thumbnailUrl = trim(env('Image_URL')).$tempLinkthumb[1];
                    }
                }
        
                if ($request->hasFile('file')) {
                    $Original = $request->file('file');
                    $OriginalFilename = 'admin_original_image_' . time() . '.' . $Original->getClientOriginalExtension();
                    $OriginalPath = 'public/admin_original_images/' . $OriginalFilename;
                    $OriginalImage = Image::make($Original);
                    $OriginalImage->save(storage_path('app/' . $OriginalPath), 100); 
                    
                    if(isset($OriginalPath)){
                        $tempLink = explode('public/', $OriginalPath);
                        $proImg->originalUrl = trim(env('Image_URL')).$tempLink[1];
                    }
    
                }
    
                $proImg->user_id = $user_id;
                $proImg->timestamp = $timestamp;
                // dd($proImg);
                $proImg->save();
    
            }
        }
        
        if(isset($data['fullName'])){
            $user->fullName = $data['fullName'];
        }

        if(isset($data['password'])){
            $user->password = Hash::make($data['password']);
        }

        if($user->save()){
            if(isset($proImg)){
                if($proImg->save()){
                    $user->fileUrl = [
                        "originalUrl" => $proImg->originalUrl,
                        "thumbnailUrl" => $proImg->thumbnailUrl,
                    ];

                    return response()->json($user);
                }
            }else{
                if($profileImg->save()){
                    $user->fileUrl = [
                        "originalUrl" => $profileImg->originalUrl,
                        "thumbnailUrl" => $profileImg->thumbnailUrl,
                    ];
                    return response()->json($user);
                } 
            }
        }
    }

    public function deleteAdmin($admin_id){

        // dd($admin_id);
        $user = Admin::where('_id', $admin_id)->first();

        $profileImg = ProfileImage::where('user_id', $admin_id)->first();

        if($user){
            // dd($profileImg);
            if($profileImg){
                // dd($profileImg->originalUrl);
                $tempLink = explode(trim(env('Image_URL')), $profileImg->originalUrl);
                Storage::delete('public/'.$tempLink[1]);

                $tempLinkthumb = explode(trim(env('Image_URL')), $profileImg->thumbnailUrl);
                Storage::delete('public/'.$tempLinkthumb[1]);
            }

            if($user->delete()){
                return response()->json(["message" => "Admin Delete Successfully"]);
            }
            
        }
        else{
            return response()->json(["message" => "Admin Not Found"], 404);
        }
       
    }
}





