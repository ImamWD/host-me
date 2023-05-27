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
use App\Models\category;
use App\Models\user;

use DB;
class categoryController extends Controller
{
    public function addcategory(Request $request)
    {
        if($request->has('Auth') && $request->Auth != NULL && $request->has('name') && $request->name != NULL)
        {
            $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
            if($users)
            {
            $category = new category;
            $category->name = $request->name;
            if($request->has('image') && $request->image != NULL)
            {
                $image = $request->file('image');
                $path = $image->store('public/categoryImages');
                $url = Storage::url($path);
                $category->imageurl = $url;
            }    
            $category->save();
            return response()->json(['added'=>"success"],200); 
           }
           else
           {
            return response()->json(['Error'=>"No Auth"],405); 
           }  
        }
        else
        {
            return response()->json(['Error'=>"Key error"],205); 

        }
    }   
    public function categoryinfo(Request $request)
    {
        if($request->has('Auth') && $request->Auth != NULL)
            {
                $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
                if($users)
                {
                    $category = DB::table('categories')->get();
                    return response()->json($category);
                }
                else
                {
                    return response()->json(['Error'=>"No Auth"],405); 
                }
            }
            else
            {
                return response()->json(['Error'=>"Key error"],205); 
            }
    }

}
