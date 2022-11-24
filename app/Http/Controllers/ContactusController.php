<?php

namespace App\Http\Controllers;

use App\Models\contactus;
use Illuminate\Http\Request;

class ContactusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('user.contactus.index');
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
     * @param  \App\Models\contactus  $contactus
     * @return \Illuminate\Http\Response
     */
    public function show(contactus $contactus)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\contactus  $contactus
     * @return \Illuminate\Http\Response
     */
    public function edit(contactus $contactus)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\contactus  $contactus
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, contactus $contactus)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\contactus  $contactus
     * @return \Illuminate\Http\Response
     */
    public function destroy(contactus $contactus)
    {
        //
    }
}
