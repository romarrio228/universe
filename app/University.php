<?php

namespace universe;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Crypt;

class University extends Model
{
    protected $table = 'university';  // 指定对应哪一张表

    protected $dates = [
        'establish_date',
        'certification_begin_date',
        'certification_end_date'
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    // 哪些字段可以写入内容
    protected $fillable = [
        'name',
        'english_name',
        'unit_number',
        'social_trust_code',
        'certification_code',
        'enterprise_code',
        'status',
        'funding_sources',
        'establish_date',
        'hosted_by',
        'admini_by',
        'initial_funding',
        'certification_begin_date',
        'certification_end_date',
    ];

    public function setEstablishDateAttribute( $date )
    {
        $this->attributes['establish_date'] = Carbon::createFromFormat( 'Y-m-d', $date );
    }

    public function setCertificationBeginDateAttribute( $date )
    {
        $this->attributes['certification_begin_date'] = Carbon::createFromFormat( 'Y-m-d', $date );
    }

    public function setCertificationEndDateAttribute( $date )
    {
        $this->attributes['certification_end_date'] = Carbon::createFromFormat( 'Y-m-d', $date );
    }


    public function setNameAttribute( $name )
    {
        //dd(encrypt( $name ));
        //return encrypt( $name );
        $this->attributes['name'] = encrypt( $name );
    }

    public function getNameAttribute( )
    {
        return decrypt( $this->attributes['name'] );
    }


    public function setEnglishNameAttribute( $name )
    {
        //dd(encrypt( $name ));
        //return encrypt( $name );
        $this->attributes['english_name'] = encrypt( $name );
    }

    public function getEnglishNameAttribute( )
    {
        return decrypt( $this->attributes['english_name'] );
    }


    public function setUnitNumberAttribute( $unitNumber )
    {
        $this->attributes['unit_number'] = encrypt( $unitNumber );
    }

    public function getUnitNumberAttribute( )
    {
        return decrypt( $this->attributes['unit_number'] );
    }


    public function setSocialTrustCodeAttribute( $socialTrustCode )
    {
        $this->attributes['social_trust_code'] = encrypt( $socialTrustCode );
    }

    public function getSocialTrustCodeAttribute( )
    {
        return decrypt( $this->attributes['social_trust_code'] );
    }


    public function setCertificationCodeAttribute( $certificationCode )
    {
        $this->attributes['certification_code'] = encrypt( $certificationCode );
    }

    public function getCertificationCodeAttribute( )
    {
        return decrypt( $this->attributes['certification_code'] );
    }


    public function setEnterpriseCodeAttribute( $enterpriseCode )
    {
        $this->attributes['enterprise_code'] = encrypt( $enterpriseCode );
    }

    public function getEnterpriseCodeAttribute( )
    {
        return decrypt( $this->attributes['enterprise_code'] );
    }


    public function setHostedByAttribute( $hostedBy )
    {
        $this->attributes['hosted_by'] = encrypt( $hostedBy );
    }

    public function getHostedByAttribute( )
    {
        return decrypt( $this->attributes['hosted_by'] );
    }


    public function setAdminiByAttribute( $adminiBy )
    {
        $this->attributes['admini_by'] = encrypt( $adminiBy );
    }

    public function getAdminiByAttribute( )
    {
        return decrypt( $this->attributes['admini_by'] );
    }


}
