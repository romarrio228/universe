<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Eloquent\SoftDeletes;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('uni_id');    // 学校ID
            $table->string('name')->unique();     // 账号，唯一，可以为 学号、工号、电话号码
            $table->string('email')->unique();    // 邮箱
            $table->string('password');
            $table->string('last_session_id')->default('0000000000000000000000000000000000000000');
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();        // 软删除
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('users');
    }
}
