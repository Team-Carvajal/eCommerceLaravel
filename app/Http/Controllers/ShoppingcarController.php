<?php

namespace App\Http\Controllers;

use App\Models\Orderbase;
use App\Models\Product;
use App\Models\Bill;
use Illuminate\Http\Request;
use Auth;

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
            ->where( "user_id","=", 3)
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
       $lastBill=$this->bill();

        if($lastBill == false){

            $bill=Bill::firstOrCreate(['user_id' => Auth::id()]);

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
        $Bill=$this->bill();

        $Bill->billState_id=2;
        $Bill->update();

        newbill();

    }

    public function update(Request $request, $id)
    {
        $Bill=$this->bill();

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

    public function updateSubtotal ($id, $cant)
    {
        $product = Product::find($id);
        $subtotal = $product->price * $cant;

        $bill = Bill::where('user_id', 3)->where('billState_id', 1)->first();

        Orderbase::where('bill_id', $bill->id)
            ->where('product_id',  $id)
            ->update(['quantity' => $cant]);

        $bill->update(['subTotal' => $subtotal]);

        echo $subtotal;

    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\shoppingcar  $shoppingcar
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){

        $lastBill=$this->bill();

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
    $bill=$this->bill();
    $bill->subTotal=Orderbase::where('bill_id','=', $bill->id)->sum('product_price');
    $bill->update();
    $product->delete();


     return redirect(redirect()->getUrlGenerator()->previous());

    }


    private function bill(){

        return Bill::where('user_id', "=", Auth::id())
            ->where('billState_id', "=", 1)
            ->first();


    }

}
