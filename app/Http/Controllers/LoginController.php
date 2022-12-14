<?php

namespace App\Http\Controllers;



use App\Models\signup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;



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

       $user = Auth::user();


      //dd($user);

      session(['name' => "{$user['name']}"]);
      session(['email' => "{$user['email']}"]);
      session(['id' => "{$user['id']}"]);
      session(['avatar' => "{$user['avatar']}"]);

      return redirect()->intended('/');

    }else{
        return redirect('login');
    }


}

    public function logout(){

         Session::flush();

          Auth::logout();

        return redirect('/');
    }

}
