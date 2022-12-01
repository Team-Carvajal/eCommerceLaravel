<?php

namespace App\Http\Controllers;

use App\Models\signup;
use App\Models\profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;



class SignupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('user.signup.index');
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request;

        $user = new signup;

            $user->name = $data['name'];
            $user->lastName = $data['lastName'];
            $user->email = $data['email'];
            $user->rol_id = 2;
            $user->password = Hash::make($data['password']);
            $user->phone = $data['phone'];
            $user->birthdate = $data['birthDay'];
            $user->save();

            $credentials = $request->validate([
                'email' => ['required', 'email'],
                'password' => ['required'],
            ]);

            if (Auth::attempt($credentials)) {
                
                $request->session()->regenerate();
                $user = Auth::user();
                session(['id' => "{$user['id']}"]);
/*
                if(signup::where('email', '=', $credentials['email'])->exists()){
                    $message = 'El usuario esta registrado';
                    return view('/', compact('message'));
                }
*/       
                return redirect()->intended('/');

            }else{
                return redirect('/');
            }

            
    }

   
}
