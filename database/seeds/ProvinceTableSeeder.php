<?php

use Illuminate\Database\Seeder;

class ProvinceTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('province')->insert([
            'country_id' => 1,
            'name' => encrypt( '北京市' ),
            'english_name' => encrypt( 'Beijing' ),
        ]);

        DB::table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '天津市' ),
        'english_name' => encrypt( 'Tianjin' ),
    ]);

        DB::table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '河北省' ),
        'english_name' => encrypt( 'Hebei' ),
    ]);

        DB::table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '山西省' ),
        'english_name' => encrypt( 'Shannxi' ),
    ]);

        DB::table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '内蒙古自治区' ),
        'english_name' => encrypt( 'Neimenggu' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '辽宁省' ),
        'english_name' => encrypt( 'Liaoning' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '吉林省' ),
        'english_name' => encrypt( 'Jilin' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '黑龙江省' ),
        'english_name' => encrypt( 'Heilongjiang' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '上海市' ),
        'english_name' => encrypt( 'Shanghai' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '江苏省' ),
        'english_name' => encrypt( 'Jiangsu' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '浙江省' ),
        'english_name' => encrypt( 'Zhejiang' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '安徽省' ),
        'english_name' => encrypt( 'Anhui' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '福建省' ),
        'english_name' => encrypt( 'Fujian' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '江西省' ),
        'english_name' => encrypt( 'Jiangxi' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '山东省' ),
        'english_name' => encrypt( 'Shandong' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '河南省' ),
        'english_name' => encrypt( 'Henan' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '湖北省' ),
        'english_name' => encrypt( 'Hubei' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '湖南省' ),
        'english_name' => encrypt( 'Hunan' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '广东省' ),
        'english_name' => encrypt( 'Guangdong' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '广西壮族自治区' ),
        'english_name' => encrypt( 'Guangxi' ),
    ]);

        DB:table('province')->insert([
            'country_id' => 1,
            'name' => encrypt( '海南省' ),
            'english_name' => encrypt( 'Hainan' ),
        ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '重庆市' ),
        'english_name' => encrypt( 'Chongqing' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '四川省' ),
        'english_name' => encrypt( 'Sichuan' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '贵州省' ),
        'english_name' => encrypt( 'Guizhou' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '云南省' ),
        'english_name' => encrypt( 'Yunnan' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '西藏自治区' ),
        'english_name' => encrypt( 'Xizang' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '陕西省' ),
        'english_name' => encrypt( 'Shanxi' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '甘肃省' ),
        'english_name' => encrypt( 'Gansu' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '青海省' ),
        'english_name' => encrypt( 'Qinghai' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '宁夏回族自治区' ),
        'english_name' => encrypt( 'Ningxia' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '新疆维吾尔自治区' ),
        'english_name' => encrypt( 'Xinjiang' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '台湾省' ),
        'english_name' => encrypt( 'Taiwan' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '香港特别行政区' ),
        'english_name' => encrypt( 'Hongkong' ),
    ]);

        DB:table('province')->insert([
        'country_id' => 1,
        'name' => encrypt( '澳门特别行政区' ),
        'english_name' => encrypt( 'Macao' ),
    ]);

    }
}
