<?php

namespace universe\Http\Controllers;

use Request;
use universe\Http\Controllers\Controller;
use universe\Country;
use universe\Province;
use universe\City;
use universe\District;
use universe\Address;

class AddressController extends Controller
{
    /* 本控制器的所有功能都要在验证后才可访问
    参考 http://9iphp.com/web/laravel/larevel-5-middleware.html

    public function __construct(){
        $this->middleware('auth');
    }*/

    /* 本控制器的全部功能都要在登陆后才可访问，除了index，show 这两个功能
    public function __construct(){
        // 除了主页之外
        $this->middleware('auth', ['except' => ['index', 'show']]);
        // 只有发布页
        //$this->middleware('auth', ['only' => 'create']);
    }
    */

    public function index()
    {
        $addresses = Address::all();   // 此处要限制：只能查看维护自己的地址，不能查看维护别人的、别校的地址。
        return view( 'address.index', compact('addresses') );
    }

    public function create()
    {
        $countries = Country::all();
        $provinces = Province::all();
        $cities = City::all();
        $districts = District::all();

        return view('address.create',compact( 'countries', 'provinces', 'cities', 'districts'));
    }

/*    public function store(Request $request)
    {
        $input = Request::all();
        dd($input);
       // Address::create( $input );

        return redirect( 'address.index' );
    }
*/
    public function store()
    {
        //dd($request);
        $input = Request::all();
        //dd($input);
        //$address = new Address();
        //$address->country_id = $request->countries
        //Address::create( $request );
        $address = new Address;
        $address->country_id = $input['countries'];
        $address->province_id = $input['provinces'];
        $address->city_id = $input['cities'];
        $address->district_id = $input['districts'];
        $address->address = $input['address'];
        $address->english_address = $input['english_address'];
        $address->zip = $input['zip'];
        $address->save();

        return redirect( 'address' );
    }

    public function show($id)
    {
        $address = Address::findOrFail( $id );
        $country = Country::findOrFail( $address->country_id );
        $country = $country->name;
        $province = Province::findOrFail( $address->province_id );
        $province = $province->name;
        $city = City::findOrFail( $address->city_id );
        $city = $city->name;
        $district = District::findOrFail( $address->district_id );
        $district = $district->name;

        return view( 'address.show', compact('address', 'country', 'province', 'city', 'district') );
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }

    public function edit($id)
    {
        $address = Address::findOrFail( $id );

//        dd($address);

        $countries = Country::all();
        $provinces = Province::all();
        $cities = City::all();
        $districts = District::all();

        dd($countries);

        return view('address.edit',compact('address', 'countries', 'provinces', 'cities', 'districts'));
    }

}
