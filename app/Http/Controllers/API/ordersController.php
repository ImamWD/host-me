<?php

namespace App\Http\Controllers\API;

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

class ordersController extends Controller
{
    //param:customer_id
    public function AddNewOrder(Request $request)
    {
        $customername = user :: where('ssn','=',$request->customer_id)->get('name');
        $CN = json_decode($customername);
        $orderkey = Str::random(rand(1,5));
        $order = new order;
        $order->customer_id=$request->customer_id;
        $order->name = $CN[0]->name." Order ".$orderkey;
        $order->available =1;
        $order->done = 1;
        $order->cancel =0;
        $order->save();
        return response()->json(['orderId' => $order->id,'customer_id' => $request->customer_id]);
    }
    //param:product_id , order_id
    public function AddNewProductToOrder(Request $request)
    {
        $order = new orderproduct;
        $order->product_id=$request->product_id;
        $order->order_id=$request->order_id;
        $order->save();
        return response()->json(['success'=>'added']);
    }
    //param:customer_id
    public function AllOrdersInfoFromOneCustomer(Request $request)
    {
        $order = order::select(DB::raw('count(`product_id`) AS `ProductsCount`'),'orders.name AS ONAME','orders.id AS Oid','users.name AS CustomerName')->
        join('users','users.ssn','=','orders.customer_id')->
        join('orderproducts','orderproducts.order_id','=','orders.id')->
        distinct()->
        groupBy('orders.name', 'orders.id', 'users.name')->
        where('orders.customer_id','=',$request->customer_id)->
        get(); 
        return response()->json($order);   
    }
    //param:order_id
    public function AllProductsFromOneOrder(Request $request)
    {
        $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
        join('categoryproducts','categoryproducts.product_id','=','products.id')->
        join('categories','categories.id','=','categoryproducts.cat_id')->
        join('shops','shops.id','=','products.shop_id')->
        join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
        join('orderproducts','orderproducts.product_id','=','products.id')->
        where('orderproducts.order_id','=',$request->order_id)->
        distinct()->
        groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
        get();
        return response()->json($product);
    }
    //param:shop_id
    public function AllOrdersInfoFromOneShop(Request $request)
    {
        $order = order::select(DB::raw('count(`product_id`) AS `ProductsCount`'),'orders.name AS ONAME','orders.id AS Oid','users.name AS CustomerName')->
        join('users','users.ssn','=','orders.customer_id')->
        join('orderproducts','orderproducts.order_id','=','orders.id')->
        join('products','products.id','=','orderproducts.product_id')->
        distinct()->
        groupBy('orders.name', 'orders.id', 'users.name')->
        where('products.shop_id','=',$request->shop_id)->
        get(); 
        return response()->json($order);   
    }
    
     //param:order_id , shop_id
     public function AllProductsFromOneOrderOneShop(Request $request)
     {
         $product = product::select(DB::raw('AVG(`Evaluation`) AS `AVGFEEDBACK`'),'products.*','categories.name AS CNAME','categories.imageurl AS CIMAGE','shops.name AS SNAME','shops.logourl AS SIMAGE')->
         join('categoryproducts','categoryproducts.product_id','=','products.id')->
         join('categories','categories.id','=','categoryproducts.cat_id')->
         join('shops','shops.id','=','products.shop_id')->
         join('productfeedbacks','productfeedbacks.product_id','=','products.id')->
         join('orderproducts','orderproducts.product_id','=','products.id')->
         where('orderproducts.order_id','=',$request->order_id)->
         where('products.shop_id','=',$request->shop_id)->

         distinct()->
         groupBy('products.id', 'products.name', 'categories.name','products.price','products.imageurl','products.discount','products.description','products.shop_id','products.created_at','products.updated_at','categories.imageurl', 'shops.name', 'shops.logourl')->
         get();
         return response()->json($product);
     }

}
