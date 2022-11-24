<?php

namespace App\Http\Controllers;

use App\Models\signup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\signup  $signup
     * @return \Illuminate\Http\Response
     */
    public function show(signup $signup)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\signup  $signup
     * @return \Illuminate\Http\Response
     */
    public function edit(signup $signup)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\signup  $signup
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, signup $signup)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\signup  $signup
     * @return \Illuminate\Http\Response
     */
    public function destroy(signup $signup)
    {
        //
    }
}
