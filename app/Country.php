<?php

namespace universe;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Crypt;

class Country extends Model
{
    protected $table = 'country';

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $fillable = [
        'name',
        'english_name',
    ];

    /*
     *  国家拥有多个省份
     */
    public function Province()
    {
        $this->hasMany('App\Province');
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
