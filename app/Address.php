<?php

namespace universe;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Crypt;

class Address extends Model
{
    protected $table = 'address';

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $fillable = [
        'country_id', 'province_id', 'city_id', 'district_id',
        'address', 'english_address', 'zip', 'flag',
    ];

    public function setAddressAttribute( $address )
    {
        $this->attributes['address'] = encrypt( $address );
    }

    public function getAddressAttribute( )
    {
        return decrypt( $this->attributes['address'] );
    }

    public function setEnglishAddressAttribute( $english_address )
    {
        $this->attributes['english_address'] = encrypt( $english_address );
    }

    public function getEnglishAddressAttribute( )
    {
        return decrypt( $this->attributes['english_address'] );
    }

    public function setZipAttribute( $zip )
    {
        $this->attributes['zip'] = encrypt( $zip );
    }

    public function getZipAttribute( )
    {
        return decrypt( $this->attributes['zip'] );
    }

}
