<?php

use Illuminate\Database\Seeder;

class CityTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('city')->insert([
            'province_id' => 19,
            'name' => encrypt( '广州市' ),
            'english_name' => encrypt( 'Guangzhou' ),
        ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '韶关市' ),
        'english_name' => encrypt( 'Shaoguan' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '深圳市' ),
        'english_name' => encrypt( 'Shenzhen' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '珠海市' ),
        'english_name' => encrypt( 'Zhuhai' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '汕头市' ),
        'english_name' => encrypt( 'Shantou' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '佛山市' ),
        'english_name' => encrypt( 'Foshan' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '江门市' ),
        'english_name' => encrypt( 'Jiangmen' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '湛江市' ),
        'english_name' => encrypt( 'Zhanjiang' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '茂名市' ),
        'english_name' => encrypt( 'Maoming' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '肇庆市' ),
        'english_name' => encrypt( 'Zhaoqing' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '惠州市' ),
        'english_name' => encrypt( 'Huizhou' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '梅州市' ),
        'english_name' => encrypt( 'Meizhou' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '汕尾市' ),
        'english_name' => encrypt( 'Shanwei' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '河源市' ),
        'english_name' => encrypt( 'Heyuan' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '阳江市' ),
        'english_name' => encrypt( 'Yangjiang' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '清远市' ),
        'english_name' => encrypt( 'Qingyuan' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '东莞市' ),
        'english_name' => encrypt( 'Dongguan' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '中山市' ),
        'english_name' => encrypt( 'Zhongshan' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '潮州市' ),
        'english_name' => encrypt( 'Chaozhou' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '揭阳市' ),
        'english_name' => encrypt( 'Jieyang' ),
    ]);

        DB::table('city')->insert([
        'province_id' => 19,
        'name' => encrypt( '云浮市' ),
        'english_name' => encrypt( 'Yunfu' ),
    ]);

    }
}
