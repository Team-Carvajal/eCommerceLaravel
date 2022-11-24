<?php

namespace App\Http\Controllers;



use App\Models\signup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class LoginController extends Controller
{

    public function index(){
        return view('user.login.index');
    }



    public function login(Request $request){
    $credentials = $request->validate([
        'email' => ['required', 'email'],
        'password' => ['required'],
    ]);

    if (Auth::attempt($credentials)) {
        $request->session()->regenerate();

        return redirect()->intended('/');
    }
}

}
