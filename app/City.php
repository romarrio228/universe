<?php

namespace universe;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Crypt;

class City extends Model
{
    protected $table = 'city';

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $fillable = [
        'province_id',
        'name',
        'english_name',
    ];

    /**
     * 城市属于一个省份
     */
    public function Province()
    {
        return $this->belongsTo('App\Province');
    }

    /**
     * 城市拥有多个县区
     */
    public function District()
    {
        return $this->hasMany('App\District');
    }

    public function setNameAttribute( $name )
    {
        $this->attributes['name'] = encrypt( $name );
    }

    public function getNameAttribute( )
    {
        return decrypt( $this->attributes['name'] );
    }

    public function setEnglishNameAttribute( $english_name )
    {
        $this->attributes['english_name'] = encrypt( $english_name );
    }

    public function getEnglishNameAttribute( )
    {
        return decrypt( $this->attributes['english_name'] );
    }

}
