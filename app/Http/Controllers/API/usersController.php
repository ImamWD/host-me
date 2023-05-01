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
                                break;
                            }
                            case 1: // o_employee
                            {
                                $UserType =  "o_employees";

                                break;
                            }
                            case 2: //subscriber
                            {
                                $UserType =  "subscribers";
                                break;
                            }
                            case 3: // s_employee
                            {
                                $UserType =  "s_employees";
                                break;
                            }                
                            case 4: // customer
                            {
                                $UserType =  "customers";
                                break;
                            }
                            default :
                            {
                                return response()->json(['Error' => "undefined user type"],205);
                            }
                        }
                        $users = User::join($UserType, 'users.ssn', '=', $UserType.'.ssn')
                        ->select('users.imageurl',
                        'users.Name',
                        'users.active',
                        'users.Email', 
                        'users.passW',
                        'users.Phone',
                        'users.location',
                        $UserType.'.salary')
                        ->get();
                        return response()->json($users);
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
}
