<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

use App\Models\user;
use App\Models\owner;
use App\Models\shop;
use App\Models\categoryshop;
use DB;

class shopController extends Controller
{
    public function addShop(Request $request)
    {
        if($request->has('Auth') && $request->Auth != NULL)
            {
                $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
               
                if($users)
                {
                    $validator = Validator::make($request->all(), [
                        'name' => 'required|min:3|max:40',
                        'location' => 'required|min:2|max:255',
                   
                    ]);
                    if ($validator->fails()) {
                        return response()->json(['errors' => $validator->errors()], 422);
                    }
                    $shop = new shop;
                    $shop->Name = $request->name;
                    $shop->location = $request->location;
                    $shop->sub_id = $request->sub_id;
                    if($request->has('image') && $request->image != NULL)
                    {
                        $image = $request->file('image');
                        $path = $image->store('public/shopImages');
                        $url = Storage::url($path);
                        $shop->logourl = $url;
                    }  
                    $shop->save(); 
                    $cat = new categoryshop;
                    $cat->shop_id = $shop->id;
                    $cat->cat_id = $request->cat_id;
                    $cat->save(); 
                    return response()->json(['add'=>"success"],200);   

                }
                else
                {
                    return response()->json(['Error'=>"No Auth"],205);   
                }
            }
            else
            {
                return response()->json(['Error'=>"Key Error"],405);   
            }
    }
    public function getallShops(Request $request)
    {
        if($request->has('Auth') && $request->Auth != NULL)
            {
                $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
                
                if($users)
                {
                    $shops = shop::join('users', 'users.ssn', '=','shops.sub_id')->
                    join('categoryshops','categoryshops.shop_id','=','shops.id')->
                    join('categories','categories.id','=','categoryshops.cat_id')->
                    select('shops.*','users.Name as UNAME','categories.name as CNAME','categories.imageurl')->get();
                    return response()->json($shops);
                }
                else
                {
                    return response()->json(['Error'=>"No Auth"],205);   
                }
            }
            else
            {
                return response()->json(['Error'=>"Key Error"],405);   
            }
    }
    public function oneshop(Request $request)
    {
        
        if($request->has('Auth') && $request->Auth != NULL)
            {
                $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
                if($users)
                {
                    if($request->has('Sid') && $request->Sid != NULL)
                    {
                        $RES = DB::table('shops')->
                        select('shops.*','categories.imageurl as Cimage','categories.name as CNAME','users.name as UNAME','users.imageurl as UIMAGE')->
                        join('categoryshops','categoryshops.shop_id','=','shops.id')->
                        join('categories','categories.id','=','categoryshops.cat_id')->
                        join('subscribers','subscribers.ssn','=','shops.sub_id')->
                        join('users','users.ssn','=','subscribers.ssn')->
                        where('shops.id','=',$request->Sid)->get();
                        return response()->json($RES);
                    }
                    else
                    {
                        return response()->json(['Error'=>"No Sid"],204);   
                    }
                }
                else
                {
                    return response()->json(['Error'=>"No Auth"],205);   
                }
            }
            else
            {
                return response()->json(['Error'=>"Key Error"],405);   
            }
           
    }
}
