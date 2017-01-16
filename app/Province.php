<?php

namespace universe;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Crypt;

class Province extends Model
{
    protected $table = 'province';

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $fillable = [
        'country_id',
        'name',
        'english_name',
    ];

    /*
     *  省份属于一个国家
     */
    public function Country()
    {
        return $this->belongsTo('App\Country');
    }

    /**
     * 省份拥有多个城市
     */
    public function City()
    {
        return $this->hasMany('App\City');
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
