<?php

namespace App\Http\Controllers;

use App\Models\shoppingcar;
use Illuminate\Http\Request;

class ShoppingcarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('user.shoppingcar.index');
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function show(shoppingcar $shoppingcar)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function edit(shoppingcar $shoppingcar)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, shoppingcar $shoppingcar)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function destroy(shoppingcar $shoppingcar)
    {
        //
    }
}
