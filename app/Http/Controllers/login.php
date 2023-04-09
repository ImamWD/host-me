<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class login extends Controller
{
    public function login(){
        return view('login.login');
    }
    public function signup(){
        return view('login.signup');
    }
}
