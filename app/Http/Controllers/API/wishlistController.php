<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

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
use App\Models\order;
use App\Models\orderproduct;
use App\Models\wishlist;


class wishlistController extends Controller
{
    //param:customer_id , product_id
    public function AddProductToWishlist(Request $request)
    {
        $wishlist = new wishlist;
        $wishlist->product_id = $request->product_id;
        $wishlist->customer_id = $request->customer_id;
        $wishlist->save();
        return response()->json(['success'=>'added']);
    }
    //param:customer_id
    public function AllProductsInfoInWishlistToOneCustomer(Request $request)
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        join('wishlists','wishlists.product_id','=','products.id')->
        where('wishlists.customer_id','=',$request->customer_id)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }

    //param:customer_id , product_id
    public function RemoveProductinWishlist(Request $request)
    {
        wishlist::where('customer_id', '=', $request->customer_id)->
        where('product_id', '=', $request->product_id)->
        delete();
        return response()->json(['success' => "deleted"],205);
    }
}
