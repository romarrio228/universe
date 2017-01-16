<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUniversityTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('university', function (Blueprint $table) {
            $table->increments( 'id' );  // 本系统唯一编号
            $table->char('unit_number', 255 );   // 学校事业单位编号，指的是什么类型的学校，工业中等专科学校，高等大学
            $table->char( 'social_trust_code', 255 )->unique();   // 统一社会信用代码  12440000456488032C
            $table->char( 'certification_code', 255 )->unique();  // 证书识别码： 12440000456488032C-01
            $table->char( 'enterprise_code', 255 )->unique();   // 事证号： 144000000098
            $table->char( 'name', 255 );   // 肇庆学院，学校名，127个汉字
            $table->char( 'english_name', 255 );   // 学校英文名
            $table->tinyInteger( 'status' );   // 单位状态： 0-正常 , 其他待定义
            $table->tinyInteger( 'funding_sources' );   // 经费来源： 0-财政核拨 ，其他待定义
            $table->date( 'establish_date' );   // 设立登记时间： 2001-11-23
            $table->char( 'hosted_by', 255 );    // 举办单位： 广东省教育厅
            $table->char( 'admini_by', 255 );    // 登记管理机关： 广东省事业单位改革服务局
            $table->unsignedBigInteger( 'initial_funding' );  // 开办资金： ￥67133.0万元 ，改用“元”为单位
            $table->date( 'certification_begin_date' );    // 证书有效期： 2016-06-23 至 2021-06-22
            $table->date( 'certification_end_date' );    // 证书有效期： 2016-06-23 至 2021-06-2
            $table->softDeletes();    // 软删除
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('university');
    }
}
