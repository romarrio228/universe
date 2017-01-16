<?php

use Illuminate\Database\Seeder;

class DistrictTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '端州区' ),
        'english_name' => encrypt( 'Duanzhou' ),
    ]);

        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '鼎湖区' ),
        'english_name' => encrypt( 'Dinghu' ),
    ]);
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '高要区' ),
        'english_name' => encrypt( 'Gaoyao' ),
    ]);
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '广宁县' ),
        'english_name' => encrypt( 'Guangning' ),
    ]);
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '怀集县' ),
        'english_name' => encrypt( 'Huaiji' ),
    ]);
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '封开县' ),
        'english_name' => encrypt( 'Fengkai' ),
    ]);
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '德庆县' ),
        'english_name' => encrypt( 'Deqing' ),
    ]);
        DB::table('district')->insert([
        'city_id' => 10,
        'name' => encrypt( '四会市' ),
        'english_name' => encrypt( 'Sihui' ),
    ]);


    }
}
