<?php

namespace universe;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Crypt;

class District extends Model
{
    protected $table = 'district';

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $fillable = [
        'city_id',
        'name',
        'english_name',
    ];

    /**
     * 县区属于一个城市
     */
    public function City()
    {
        return $this->belongsTo('App\City');
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
