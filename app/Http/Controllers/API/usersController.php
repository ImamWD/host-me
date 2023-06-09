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

class usersController extends Controller
{
    public function UsersInfo(Request $request)
    {
        if($request->has('Auth') && $request->Auth != NULL && $request->has('type') && $request->type != NULL)
            {
                $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
                if($users)
                {
                    $owner = owner::where('ssn',"=" , $users)->value('ssn');
                    if($owner)
                    {
                        //if type =
                        // 0=>owner , 
                        //1=>o_employees ,
                        // 2=>subscriber ,
                        // 3=>s_employees ,
                        // 4=>customers 
                        $UserType = NULL;
                        switch($request->type)
                        {
                            case 0: // owner
                            {
                                $UserType =  "owners";
                               
                                $users = User::join($UserType, 'users.ssn', '=', $UserType.'.ssn')
                                ->select('users.ssn',
                                'users.imageurl',
                                'users.Name',
                                'users.active',
                                'users.Email', 
                                'users.passW',
                                'users.Phone',
                                'users.location',
                                $UserType.'.keyOwner'
                                
                        )
                        ->get();
                        return response()->json($users);
                                break;
                            }
                            case 1: // o_employee
                            {
                                $UserType =  "o_employees";
                                $users = User::join($UserType, 'users.ssn', '=', $UserType.'.ssn')
                                ->select('users.ssn',
                                'users.imageurl',
                                'users.Name',
                                'users.active',
                                'users.Email', 
                                'users.passW',
                                'users.Phone',
                                'users.location',
                                $UserType.'.salary',
                                $UserType.'.access_o',
                                $UserType.'.access_s'
                        )
                        ->get();
                        return response()->json($users);

                                break;
                            }
                            case 2: //subscriber
                            {
                                $UserType =  "subscribers";
                                $users = User::join($UserType, 'users.ssn', '=', $UserType.'.ssn')
                                ->select('users.ssn',
                                'users.imageurl',
                                'users.Name',
                                'users.active',
                                'users.Email', 
                                'users.passW',
                                'users.Phone',
                                'users.location',
                                $UserType.'.budget'
                                
                        )
                        ->get();
                        return response()->json($users);
                                break;
                            }
                            case 3: // s_employee
                            {
                                $UserType =  "s_employees";
                                $users = User::join($UserType, 'users.ssn', '=', $UserType.'.ssn')
                                ->join('users as U', $UserType.'.s_ssn', '=', 'U.ssn')
                                ->select('users.ssn',
                                'users.imageurl',
                                'users.Name',
                                'users.active',
                                'users.Email', 
                                'users.passW',
                                'users.Phone',
                                'users.location',
                                $UserType.'.access_s',
                                'U.Name AS CNAME'
                        )
                        ->get();
                        return response()->json($users);
                                break;
                            }                
                            case 4: // customer
                            {
                                $UserType =  "customers";
                                $users = User::join($UserType, 'users.ssn', '=', $UserType.'.ssn')
                                ->select('users.ssn',
                                'users.imageurl',
                                'users.Name',
                                'users.active',
                                'users.Email', 
                                'users.passW',
                                'users.Phone',
                                'users.location',
                        )
                        ->get();
                        return response()->json($users);
                                break;
                            }
                            default :
                            {
                                return response()->json(['Error' => "undefined user type"],205);
                            }
                        }
                        
                    }
                    else
                    {
                        return response()->json(['Error' => "Not owner"],205);
                    }
                }
                else
                {
                    return response()->json(['Error' => "No Auth"],205);
                }
            }
            else
            {
                return response()->json(['Error' => "undefined key"],205);
            }

    }
    public function UsersDelete(Request $request)
    {
        if($request->has('Auth') && $request->Auth != NULL)   
        {
            $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
            if($users)
            {
                user::where('SSN', '=', $request->ssn)->delete();
                return response()->json(['success' => "deleted"],205);

            }
            else
            {
                return response()->json(['Error' => "No Auth"],205);
            }
        }
        else
        {
                return response()->json(['Error' => "undefined key"],205);
        }
    }
}