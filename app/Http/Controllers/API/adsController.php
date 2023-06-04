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
use App\Models\advertisement;
use App\Models\shop;

use DB;

class adsController extends Controller
{
   public function addAds(Request $request)
   {
    
    $ads = new advertisement;
    if($request->has('Sid') && $request->Sid != NULL)
    {
        $ads->shop_id = $request->Sid;
    }
    else
    {
        return response()->json(['Error'=>"No Sid"],422);   
    }
    if($request->has('Ended') && $request->Ended != NULL)
    {
        $ads->Ended = $request->Ended;
    }
    else
    {
        return response()->json(['Error'=>"No Ended"],422);   
    }
    if($request->has('image') && $request->image != NULL)
    {
        $image = $request->file('image');
        $path = $image->store('public/adsImages');
        $url = Storage::url($path);
        $ads->imageurl = $url;
    }    
    $ads->active = 0;
    $ads->save();
    return response()->json(['success'=>"added"],200);   
   }
   public function allAdsinfo()
   {
     $ads =  DB::table('advertisements')
     ->select(DB::raw('DATEDIFF(`Ended`, CURDATE()) AS `period`'), 'advertisements.*', 'shops.name as shopname', 'shops.logourl as shoplogo')
     ->join('shops', 'shops.id', '=', 'advertisements.shop_id')
     ->get();
     return response()->json($ads);
   }
   public function oneshopads(Request $request)
   {
     $ads =  DB::table('advertisements')
     ->select(DB::raw('DATEDIFF(`Ended`, CURDATE()) AS `period`'), 'advertisements.*', 'shops.name as shopname', 'shops.logourl as shoplogo')
     ->join('shops', 'shops.id', '=', 'advertisements.shop_id')
     ->where('shops.id','=',$request->shop_id)
     ->get();
     return response()->json($ads);
   }
   public function oneadinfo(Request $request)
   {
     $ads =  DB::table('advertisements')
     ->select(DB::raw('DATEDIFF(`Ended`, CURDATE()) AS `period`'), 'advertisements.*', 'shops.name as shopname', 'shops.logourl as shoplogo')
     ->join('shops', 'shops.id', '=', 'advertisements.shop_id')
     ->where('advertisements.id','=',$request->id)
     ->get();
     return response()->json($ads);
   }
   public function updateads(Request $request)
   {

    if($request->has('Auth') && $request->Auth != NULL)
    {
        $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
        if($users)
        {
            $record = advertisement::where('id', $request->id)->first();
            if($request->has('Ended') && $request->Ended != NULL)
            {
                $record->Ended = $request->Ended;
            }
            if($request->has('active') && $request->active != NULL)
            {
                $record->active = $request->active;
            }
            if($request->has('image') && $request->image != NULL)
            {
                $image = $request->file('image');
                $path = $image->store('public/adsImages');
                $url = Storage::url($path);
                $record->imageurl = $url;
            }  
            $record->save();
            return response()->json(['success'=>"Updated"],200);   
        }
        else
        {
            return response()->json(['Error' => "No Auth"],205);
        }
    }
    else
    {
        return response()->json(['Error' => "No Key"],205);
    }

    
    
   }
   public function deleteads(Request $request)
   {
    if($request->has('Auth') && $request->Auth != NULL)   
    {
        $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
        if($users)
        {
            advertisement::where('id', '=', $request->id)->delete();
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