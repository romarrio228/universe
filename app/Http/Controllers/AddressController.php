<?php

namespace universe\Http\Controllers;

use Illuminate\Http\Request;
use universe\Http\Controllers\Controller;
use universe\Country;
use universe\Province;
use universe\City;
use universe\District;
use universe\Address;

class AddressController extends Controller
{
    public function index()
    {
        $addresses = Address::all();
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
    public function store(Request $request)
    {
        dd($request);
        //$input = Request::all();
        //dd($input);
        //$address = new Address();
        //$address->country_id = $request->countries
        //Address::create( $request );

        return redirect( 'address.index' );
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