<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAddressTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('address', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('uni_id');   // 本地址所属学校ID
            $table->integer('country_id');      // 国家id
            $table->integer('province_id');     // 省份id
            $table->integer('city_id');         // 城市id
            $table->integer('district_id');     // 县区id
            $table->string('address');          // 详细地址
            $table->string('english_address'); // 详细地址，英文
            $table->string('zip',127);          // 邮政编码
            // $table->tinyInteger('flag');         0：本人住址 1：监护人 2：收信地址 3：租用地址  4：办公地址
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
        Schema::dropIfExists('address');
    }
}
