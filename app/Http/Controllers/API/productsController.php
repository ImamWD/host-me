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

                $CID=customer::select(DB::raw('max(`ssn`) AS `SSN`'))->get();
                $ID=json_decode($CID);
                $PF = new productfeedback;
                $PF->product_id = $product->id;
                $PF->customer_id = $ID[0]->SSN;
                $PF->Evaluation = 0;
                $PF->save();
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
    //param:ssn
    public function AllProductsRecoSys(Request $request) 
    {
        $customerId = $request->ssn;
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        whereIn('products.id', function ($query) use ($customerId) {
            $query->select('product_id')
                ->distinct()
                ->from('productfeedbacks')
                ->where('customer_id', $customerId);
        })
        ->whereIn('products.shop_id', function ($query) use ($customerId) {
            $query->select('s.shop_id')
                ->distinct()
                ->from('shopfeedbacks as s')
                ->where('s.customer_id', $customerId)
                ->where('s.Evaluation', '>=', 3);
        })
        ->whereIn('products.id', function ($query) {
            $query->select('pf.product_id')
                ->distinct()
                ->from('productfeedbacks as pf')
                ->where('pf.Evaluation', '>=', 3);
        })
        ->inRandomOrder()
        ->limit(3)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        if($product->isempty())
        {
            $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
            join('categoryproducts','categoryproducts.product_id','=','products.id')->
            join('categories','categories.id','=','categoryproducts.cat_id')->
            join('shops','shops.id','=','products.shop_id')->
            join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
            distinct()->
            limit(3)->
            groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
            orderByDesc(DB::raw('AVG(`Evaluation`)'))->
            get();
        }
        return response()->json($product);   

    }
    //no param
    public function AllProductsInfo() 
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }
    //param: id , name , image , price , discount , description , cid ,
    public function UpdateProduct(Request $request) 
    {
        if($request->has('Auth') && $request->Auth != NULL)   
        {
            $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
            if($users)
            {
                $record = product::where('id', $request->id)->first();
                if($request->has('name') && $request->name != NULL)
                {
                    $record->name = $request->name;
                }
                if($request->has('price') && $request->price != NULL)
                {
                    $record->price = $request->price;
                }
                if($request->has('discount') && $request->discount != NULL)
                {
                    $record->discount = $request->discount;
                }
                if($request->has('description') && $request->description != NULL)
                {
                    $record->description = $request->description;
                }
                if($request->has('image') && $request->image != NULL)
                {
                    $image = $request->file('image');
                    $path = $image->store('public/productsImages');
                    $url = Storage::url($path);
                    $record->imageurl = $url;
                }  
                $record->save();
                if($request->has('cid') && $request->cid != NULL)
                {
                    $record = categoryproduct::where('product_id', $request->id)->first();
                    $record->cat_id = $request->cid;
                }
                $record->save();
                return response()->json(['success'=>"updated"],200);   
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
    //param:id
    public function DeleteProduct(Request $request) 
    {
        if($request->has('Auth') && $request->Auth != NULL)   
        {
            $users = user::where('api_token',"=" , $request->Auth)->value('ssn');
            if($users)
            {
                product::where('id', '=', $request->id)->delete();
                return response()->json(['success' => "deleted"],205);
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
    //prarm:catid  
    public function AllProductsInfoOfSameCategory(Request $request)  
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        where('categories.id','=',$request->catid)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }
    //param:sid
    public function AllCategoriesForOneShop(Request $request) 
    {
        $product = product::select('categories.*')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        where('shops.id','=',$request->sid)->
        distinct()->
        get();
        return response()->json($product);
    } 
    //param:sid , catid
    public function AllProductsInfoOfSameCategoryOneShop(Request $request)  
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        where('categories.id','=',$request->catid)->
        where('shops.id','=',$request->sid)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }

}




