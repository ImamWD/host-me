<?php

namespace App\Http\Controllers\API;

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
use App\Models\shop;
use App\Models\product;
use App\Models\category;
use App\Models\categoryproduct;
use App\Models\productfeedback;

class productsController extends Controller
{
    //param: Auth , name , price , Sid , image , discount , description , catid
    public function addproduct(Request $request) 
    {
        if($request->has('Auth') && $request->Auth != NULL)   
        {
            $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
            if($users)
            {
                $product = new product;
                $product->name = $request->name;
                $product->price = $request->price;
                if($request->has('Sid') && $request->Sid != NULL)
                {
                    $product->shop_id = $request->Sid;
                }
                else
                {
                    return response()->json(['Error'=>"No Sid"],422);   
                }
                if($request->has('image') && $request->image != NULL)
                {
                    $image = $request->file('image');
                    $path = $image->store('public/productsImages');
                    $url = Storage::url($path);
                    $product->imageurl = $url;
                } 
                if($request->has('discount') && $request->discount != NULL)
                {
                    $product->discount = $request->discount;
                }
                if($request->has('description') && $request->description != NULL)
                {
                    $product->description = $request->description;
                }
                $product->save();
                $cat = new categoryproduct;
                $cat->product_id = $product->id;
                $cat->cat_id = $request->catid;
                $cat->save();
                return response()->json(['success'=>"added"],200);   
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
    // param:id
    public function oneproductinfo(Request $request) 
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        where('products.id','=',$request->id)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }
    // param:id
    public function AllProductsInfoFormOneShop(Request $request) 
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        where('shops.id','=',$request->id)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }
}

