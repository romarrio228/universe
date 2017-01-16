<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class UniversityTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('university')->insert([
            'unit_number' => encrypt( '123456' ),
            'social_trust_code' => encrypt( '12440000456488032C' ),
            'certification_code' => encrypt( '12440000456488032C-01' ),
            'enterprise_code' => encrypt( '144000000098' ),
            'name' => encrypt( '肇庆学院' ),
            'english_name' => encrypt( 'Zhaoqing University' ),
            'status' => 0,
            'funding_sources' => 0,
            'establish_date' =>Carbon::createFromDate(2001,11,23),
            'hosted_by' => encrypt( '广东省教育厅' ),
            'admini_by' => encrypt( '广东省事业单位改革服务局' ),
            'initial_funding' => 671330000,
            'certification_begin_date' =>Carbon::createFromDate(2016,6,23),
            'certification_end_date' =>Carbon::createFromDate(2021,6,22),
        ]);

        DB::table('university')->insert([
            'unit_number' => encrypt( '123456' ),
            'social_trust_code' => encrypt( '12440000456488099C' ),
            'certification_code' => encrypt( '12440000456488099C-01' ),
            'enterprise_code' => encrypt( '144000000099' ),
            'name' => encrypt( '广东工业大学' ),
            'english_name' => encrypt( 'Guangdong University of Technolog' ),
            'status' => 0,
            'funding_sources' => 0,
            'establish_date' =>Carbon::createFromDate(2001,11,23),
            'hosted_by' => encrypt( '广东省教育厅' ),
            'admini_by' => encrypt( '广东省事业单位改革服务局' ),
            'initial_funding' => 6671330000,
            'certification_begin_date' =>Carbon::createFromDate(2016,6,23),
            'certification_end_date' =>Carbon::createFromDate(2021,6,22),
        ]);
    }
}
