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
use App\Models\customer;

use App\Models\categoryshop;
use App\Models\shopfeedback;
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

                    $CID=customer::select(DB::raw('max(`ssn`) AS `SSN`'))->get();
                    $ID=json_decode($CID);
                    $PF = new shopfeedback;
                    $PF->shop_id = $shop->id;
                    $PF->customer_id = $ID[0]->SSN;
                    $PF->Evaluation = 0;
                    $PF->save();

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
                    $shops = DB::table('shops')->
                        select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'shops.*','categories.imageurl as Cimage','categories.name as CNAME','users.name as UNAME','users.imageurl as UIMAGE')->
                        join('categoryshops','categoryshops.shop_id','=','shops.id')->
                        join('categories','categories.id','=','categoryshops.cat_id')->
                        join('subscribers','subscribers.ssn','=','shops.sub_id')->
                        join('users','users.ssn','=','subscribers.ssn')->
                        join('shopfeedbacks','shopfeedbacks.shop_id','=','shops.id')->
                        distinct()->
                        groupBy('categories.imageurl','categories.name','users.name','users.imageurl',  'shops.id','shops.logourl','shops.location','shops.Name','shops.sub_id','shops.created_at','shops.updated_at')->
                        get();
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
                        select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'shops.*','categories.imageurl as Cimage','categories.name as CNAME','users.name as UNAME','users.imageurl as UIMAGE')->
                        join('categoryshops','categoryshops.shop_id','=','shops.id')->
                        join('categories','categories.id','=','categoryshops.cat_id')->
                        join('subscribers','subscribers.ssn','=','shops.sub_id')->
                        join('users','users.ssn','=','subscribers.ssn')->
                        join('shopfeedbacks','shopfeedbacks.shop_id','=','shops.id')->
                        distinct()->
                        groupBy('categories.imageurl','categories.name','users.name','users.imageurl',  'shops.id','shops.logourl','shops.location','shops.Name','shops.sub_id','shops.created_at','shops.updated_at')->
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
    public function allshopsfromeoneowner(Request $request)
    {
       
                $shops = DB::table('shops')->
                    select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'shops.*','categories.imageurl as Cimage','categories.name as CNAME','users.name as UNAME','users.imageurl as UIMAGE')->
                    join('categoryshops','categoryshops.shop_id','=','shops.id')->
                    join('categories','categories.id','=','categoryshops.cat_id')->
                    join('subscribers','subscribers.ssn','=','shops.sub_id')->
                    join('users','users.ssn','=','subscribers.ssn')->
                    join('shopfeedbacks','shopfeedbacks.shop_id','=','shops.id')->
                    distinct()->
                    groupBy('categories.imageurl','categories.name','users.name','users.imageurl',  'shops.id','shops.logourl','shops.location','shops.Name','shops.sub_id','shops.created_at','shops.updated_at')->
                    where('shops.sub_id','=',$request->sub_id)->
                    get();
                    return response()->json($shops);
           
    }

}
