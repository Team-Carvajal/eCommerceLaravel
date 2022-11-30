<?php

namespace App\Http\Controllers;

use App\Models\Orderbase;
use App\Models\Bill;
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

        $data=Bill::with("orders")
            ->withCount("orders")
            ->where( "user_id","=", session('id'))
            ->where("billstate_id", "=", 1)
            ->get();

        return view('user.shoppingcar.index', compact("data"));
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
    public function newbill()
    {
        $lastBill=Bill::where('user_id', "=", session('id'))
            ->where('billState_id', "=", 1)
            ->exists();

        if($lastBill == false){

            $bill=new Bill;
            $bill->billState_id=1;
            $bill->paymentMethod_id=1;
            $bill->user_id=3;
            $bill->save();

        }
        return redirect(redirect()->getUrlGenerator()->previous());

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function show( $shoppingcar)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function order( $shoppingcar)
    {
        $Bill=Bill::where('user_id', "=", session('id'))
            ->where('billState_id', "=", 1)
            ->first();

        $Bill->billState_id=2;
        $Bill->update();

        newbill();

    }

    public function update(Request $request, $id)
    {
        $Bill=Bill::where('user_id', "=", session('id'))
            ->where('billState_id', "=", 1)
            ->first();

        $inCar=Orderbase::where('bill_id', '=', $Bill->id)
            ->where('product_id', '=', $id)
            ->first();

        $inCar->quantity=$request->quantity;
        $inCar->product_price=($request->quantity * $inCar->product_price);
        $Bill->subTotal=Orderbase::where('bill_id', '=', $Bill->id)->sum('product_price');
        $Bill->update();
        $inCar->update();

        return redirect(redirect()->getUrlGenerator()->previous());

    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){

        $lastBill=Bill::where('user_id', "=", session('id'))
            ->where('billState_id', "=", 1)
            ->first();

        $lastProduct=Orderbase::where("product_id", "=", $request->product_id)
            ->where("bill_id", "=", $lastBill->id)
            ->first();

        if($lastProduct == null){

            $insert=new Orderbase;

            $insert->product_id=$request->product_id;
            $insert->product_price=($request->product_price * $request->quantity);
            $insert->bill_id=$lastBill->id;
            $insert->quantity=$request->quantity;
            $insert->save();

            $lastBill->subTotal=Orderbase::where('bill_id', '=', $lastBill->id)->sum('product_price');
            $lastBill->update();

        }else{

        $lastProduct->quantity+=$request->quantity;
        $lastProduct->product_price=($request->quantity * $request->product_price);
        $lastProduct->update();

        $lastBill->subTotal=Orderbase::where('bill_id', '=', $lastBill->id)->sum('product_price');
        $lastBill->update();

        }

    // Aqui tambien poner la ruta de donde vino la petición
    return redirect(redirect()->getUrlGenerator()->previous());

}

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */


    public function destroy($id){

    $product=Orderbase::where('product_id', '=', $id)->first();
    $bill=Bill::find($product->bill_id);
    $bill->subTotal=Orderbase::where('bill_id','=', $bill->id)->sum('product_price');
    $bill->update();
    $product->delete();


     return redirect(redirect()->getUrlGenerator()->previous());

    }

}
