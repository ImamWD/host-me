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
use App\Models\shopfeedback;

class feedbackController extends Controller
{
        //param:shop_id , customer_id
    public function Addshopfeedback(Request $request)
    {
        $shopfd = new shopfeedback;
        $shopfd->shop_id = $request->shop_id;
        $shopfd->customer_id = $request->customer_id;
        $shopfd->Evaluation = $request-> Evaluation;
        $shopfd->save();
        return response()->json(['success'=>'added']);

    }
    //param:product_id , customer_id
    public function Addproductfeedback(Request $request)
    {
        $productfd = new productfeedback;
        $productfd->product_id = $request->product_id;
        $productfd->customer_id = $request->customer_id;
        $productfd->Evaluation = $request-> Evaluation;
        $productfd->save();
        return response()->json(['success'=>'added']);

    }
    //param:product_id , customer_id
    public function productfeedbackinfo(Request $request)
    {
        $pf = productfeedback::where('customer_id','=',$request->customer_id)->
        where('product_id','=',$request->product_id)->get('Evaluation');
        return response()->json($pf);
    }
    //param:shop_id , customer_id
    public function shopfeedbackinfo(Request $request)
    {
        $pf = shopfeedback::where('customer_id','=',$request->customer_id)->
        where('shop_id','=',$request->shop_id)->get('Evaluation');
        return response()->json($pf);
    }

    
}