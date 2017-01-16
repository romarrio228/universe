<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class AddressTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('address')->insert([
            'country_id' => 1,
            'province_id' => 19,
            'city_id' => 10,
            'district_id' => 1,
            'address' => encrypt( '建设三路1号301' ),
            'english_address' => encrypt( '#301 building 1, Jianshe 3 route' ),
            'zip' =>  encrypt( '526040' ),
            // 'flag' => 0,
        ]);

    }
}
