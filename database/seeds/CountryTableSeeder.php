<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class CountryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('country')->insert([
            'name' => encrypt( '中国' ),
            'english_name' => encrypt( 'China' ),
        ]);

        DB::table('country')->insert([
             'name' => encrypt( '美国' ),
            'english_name' => encrypt( 'USA' ),
        ]);

        DB::table('country')->insert([
            'name' => encrypt( '英国' ),
            'english_name' => encrypt( 'England' ),
        ]);

        DB::table('country')->insert([
            'name' => encrypt( '日本' ),
            'english_name' => encrypt( 'Japan' ),
        ]);

    }
}
