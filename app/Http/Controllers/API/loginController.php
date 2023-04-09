<?php
namespace App\Http\Controllers\API;

use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

use App\Models\user;
use App\Models\owner;
use App\Models\o_employee;
use App\Models\s_employee;
use App\Models\subscriber;
use App\Models\customer;
use DB;

use Illuminate\Support\Facades\Mail;


  
class  loginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|min:9|max:255',
            'password' => 'required|min:8|max:50',
        ]);
    
        // Check if the validation fails
        if ($validator->fails()) {
            return response()->json(['error' => "Error for email or password format "], 400);
        }
        $users = user::where('Email',"=", $request->email)->first();
        if ($users) 
        {
            $users = user::where('passW',"=", $request->password)->value('ssn');
            if($users)
            {
                $token = Str::random(80);
                DB::update('update users set api_token = ? where ssn = ?',[$token,$users]);
                // check user type
                $user_type = NULL;
                $owners = owner::where('ssn', $users)->value('ssn');
                if($owners != null)
                {
                    $user_type = "owner";
                }
                else
                {
                    $o_employees = o_employee::where('ssn', $users)->value('ssn');
                    if($o_employees != null)
                    {
                        $user_type = "o-employee";
                    }
                    else
                    {
                        $subscribers = subscriber::where('ssn', $users)->value('ssn');
                        if($subscribers != null)
                        {
                            $user_type = "subscriber";
                        }
                        else
                        {
                            $s_employees = s_employee::where('ssn', $users)->value('ssn');
                            if($s_employees != null)
                            {
                                $user_type = "s_employee";
                            }
                            else
                            {
                                $customers = customer::where('ssn', $users)->value('ssn');
                                if($customers != null)
                                {
                                    $user_type = "customer";
                                }
                            }
                        }
                    }
                }
                return response()->json(['success' => true, 'token' => $token, 'user_id' => $users , 'user_type' => $user_type]);
            }
        }
            return response()->json(['success' => false, 'error' => 'Invalid credentials'], 401);
    }

    public function customerSignup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|min:3|max:40',
            'email' => 'required|email|min:9|max:255|unique:users,email',
            'password' =>'required|min:8|max:20',
            'config_password' =>'required|min:8|max:20',  
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $password = $request->password;
        $config_pass = $request->config_password;
        if($password === $config_pass)
        {      

            $user = new user;
            $user->Name = $request->name;
            $user->Email = $request->email;
            $user->passW = $request->password;
            if($request->has('phone') && $request->phone != NULL)
            {
                $user->Phone = $request->phone;
            }
            if($request->has('location') && $request->location != NULL)
            {
                $user->Location = $request->location;
            }
            if($request->has('image') && $request->image != NULL)
            {
                $image = $request->file('image');
                $path = $image->store('public/userImages');
                $url = Storage::url($path);
                $user->imageurl = $url;
              

            }    
            $user->save();
            if($user)
            {
                $users = user::where('Email',"=", $request->email)->value('ssn');
                $customer = new customer;
                $customer->ssn = $users;
                $customer->save();
                return response()->json(['signup'=>"1"],200);   
            }
        }
        else
        {
            return response()->json(['errors'=>"No configration password"],422);   
        }
    }

     // Your controller code here...
}

