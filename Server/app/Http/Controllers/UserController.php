<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\OneSignal;
use App\Models\Donation;
use App\Models\ProfileImage;
use App\Models\ForgetPass;
use App\Mail\ForgetPasswordMail;
use Illuminate\Support\Facades\Mail;
use Validator;
use Carbon\Carbon;
use Auth;
use Intervention\Image\Facades\Image;
use Storage;

class UserController extends Controller
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
            'oneSignalId' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $_id = Carbon::now()->getTimestampMs();
        $timestamp = Carbon::now()->timestamp;

        $newUser = new User();
        $newUser->fullName = $data['fullName'];
        $newUser->email = $data['email'];
        $newUser->password = bcrypt($data['password']);
        
        
        $newUser->_id = strval($_id);
        $newUser->timestamp = $timestamp;

        if($newUser->save()){
            $newUser->fileUrl = "";

            $oneSignal = new OneSignal();
            $oneSignal->user_id = $newUser->_id;
            $oneSignal->oneSignalId = $data['oneSignalId'];
            $oneSignal->timestamp = $timestamp;

            $donation = new Donation();
            $donation->user_id = $newUser->_id;
            $donation->totalDonation = 0;
            $donation->timestamp = $timestamp;

            if($oneSignal->save()){
                $donation->save();
                return response()->json(["newUser"=> $newUser, "oneSignalId" => $oneSignal->oneSignalId], 201);
            }
        }else{
            return response()->json(["message" => "Email Already Exists"], 409);
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
            'oneSignalId' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }

        $user = User::where('email', $data['email'])->first();
        
        if($user){
            if(Auth::attempt(['email' => $data['email'], 'password' => $data['password']])){
                $donation = Donation::where('user_id', $user->_id)->first();
                if($donation){
                    $user->totalDonation = $donation->totalDonation;
                }else{
                    $user->totalDonation = "";
                }

                $profileImg = ProfileImage::where('user_id', $user->_id)->first();
                if($profileImg){
                    // $user->fileUrl = [
                    //     "originalUrl" => $profileImg->originalUrl,
                    //     "thumbnailUrl" => $profileImg->thumbnailUrl,
                    // ];
                    $user->originalUrl = $profileImg->originalUrl;
                    $user->thumbnailUrl = $profileImg->thumbnailUrl;

                }else{
                    $user->originalUrl = "";
                    $user->thumbnailUrl = "";
                }

                $oneSignal = OneSignal::where('user_id', $user->_id)->first();

                if($oneSignal){
                    $oneSignal->oneSignalId = $data['oneSignalId'];
                    if($oneSignal->save()){
                        $user->oneSignalId = $oneSignal->oneSignalId;
                    }
                }

                return response()->json(["user"=> $user, "oneSignalId" => $user->oneSignalId], 200);

                
            }
            else{
                return response()->json(["message" => "Credential not matched"], 404);
            }
        }else{
            return response()->json(["message" => "No User Found"], 404);
        }
    }

    public function show($user_id){
        $user = User::join('donations', 'donations.user_id', '=', 'users._id')
            ->join('one_signals', 'one_signals.user_id', '=', 'users._id')
            ->where('users._id', $user_id)
            ->select('users.*', 'donations.totalDonation', 'one_signals.oneSignalId')
            ->first();

        $profileImg = ProfileImage::where('user_id', $user_id)->first();
        if($profileImg){
            
            $user->originalUrl = $profileImg->originalUrl;
            $user->thumbnailUrl = $profileImg->thumbnailUrl;

        }else{
            $user->originalUrl = "";
            $user->thumbnailUrl = "";
        }
        return response()->json($user);

    }

    public function index()
    {
        $users = User::join('donations', 'donations.user_id', '=', 'users._id')
            ->join('one_signals', 'one_signals.user_id', '=', 'users._id')
            ->select('donations.totalDonation', 'one_signals.oneSignalId', 'users.*')
            ->get();

        foreach ($users as $user) {
            // Fetch profile image
            $profileImg = ProfileImage::where('user_id', $user->_id)->first();

            if ($profileImg) {
                $user->originalUrl = $profileImg->originalUrl;
                $user->thumbnailUrl = $profileImg->thumbnailUrl;
            } else {
                $user->originalUrl = "";
                $user->thumbnailUrl = "";
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

        $user = User::where('email', $data['email'])->First();
        

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
                $user = User::where('email', $data['email'])->first();
                $user->password = bcrypt($data['newPassword']);
                if($user->save()){
                    $forgetPass->delete();
                    return response()->json(["message" => "Password change successfully"], 200);
                }
            }
        }else{
            return response()->json(["message" => "No request found"], 404);
        }
    }

    public function updateUser(Request $request, $user_id){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        
        $user = User::where('_id', $user_id)->first();

        $profileImg = ProfileImage::where('user_id', $user_id)->first();

        if($request->hasfile('file')){
            if($profileImg){
                if ($request->hasFile('file')) {
                    $tempLink = explode(trim(env('Image_URL')), $profileImg->thumbnailUrl);
                    Storage::delete('public/'.$tempLink[1]);
                   
                    $thumbnail = $request->file('file');
                    $thumbnailFilename = 'user_thumbnail_image_' . time() . '.' . $thumbnail->getClientOriginalExtension();
                    $thumbnailPath = 'public/user_thumbnail_images/' . $thumbnailFilename;
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
                    $OriginalFilename = 'user_original_image_' . time() . '.' . $Original->getClientOriginalExtension();
                    $OriginalPath = 'public/user_original_images/' . $OriginalFilename;
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
                    $thumbnailFilename = 'user_thumbnail_image_' . time() . '.' . $thumbnail->getClientOriginalExtension();
                    $thumbnailPath = 'public/user_thumbnail_images/' . $thumbnailFilename;
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
                    $OriginalFilename = 'user_original_image_' . time() . '.' . $Original->getClientOriginalExtension();
                    $OriginalPath = 'public/user_original_images/' . $OriginalFilename;
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
            $user->password = bcrypt($data['password']);
        }

        if($user->save()){
            if(isset($proImg)){
                if($proImg->save()){
                    
                    $user->originalUrl = $proImg->originalUrl;
                    $user->thumbnailUrl = $proImg->thumbnailUrl;

                    return response()->json($user);
                }
            }else{
                if($profileImg->save()){
                    $user->originalUrl = $profileImg->originalUrl;
                    $user->thumbnailUrl = $profileImg->thumbnailUrl;
                    return response()->json($user);
                } 
            }
        }
    }

    public function updateDonation(Request $request, $user_id){
        $input = $request->all();

        $dataVallidation = Validator::make($input,[
            'data' => 'required|json',
        ]);

        if($dataVallidation->fails()){
            return response()->json(['error' => $dataVallidation->errors()],422);
        }


        $data = json_decode($request->data, true);

        $vallidation = Validator::make($data,[
            'donationAmount' => 'required',
        ]);

        if($vallidation->fails()){
            return response()->json(['error' => $vallidation->errors()],422);
        }
        // dd($data['donationAmount']);

        $donation = Donation::where('user_id', $user_id)->first();
        
        $donation->totalDonation += doubleval($data['donationAmount']);
        
        if($donation->save()){
            $user = User::where('_id', $user_id)->first();
            $user->totalDonation = $donation->totalDonation;

            $oneSignal = OneSignal::where('user_id', $user_id)->first();
            
            $user->oneSignalId = $oneSignal->oneSignalId;

            $profileImg = ProfileImage::where('user_id', $user_id)->first();
            $user->fileUrl = [
                "originalUrl" => $profileImg->originalUrl,
                "thumbnailUrl" => $profileImg->thumbnailUrl,
            ];

            return response()->json($user);

        }
    }

    public function deleteUser($user_id){
        $user = User::where('_id', $user_id)->first();

        $profileImg = ProfileImage::where('user_id', $user_id)->first();

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
                return response()->json(["message" => "User Delete Successfully"]);
            }
            
        }
        else{
            return response()->json(["message" => "User Not Found"], 404);
        }
       
    }
    
}
