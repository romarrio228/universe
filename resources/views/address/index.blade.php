@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">仪表板</div>

                    <div class="panel-body">
                        <h4>地址列表</h4>
                        <hr/>
                        @foreach( $addresses as $address )
                            <address>
                            <h3>
                                <a href="{{ action('AddressController@show', [$address->id]) }}"> {{ $address->address }}</a>
                            </h3>
                            <h4><div class="serial_number">国家 {{ $address->country_id }}</div></h4>
                            <h4><div class="english_name">省份 {{ $address->province_id }}</div></h4>
                            <h4><div class="type">城市 {{ $address->city_id }}</div></h4>
                            <h4><div class="property">县区 {{ $address->district_id }}</div></h4>
                            <h4><div class="total_class_hours">地址 {{ $address->address }}</div></h4>
                            <h4><div class="total_credits">英文地址 {{ $address->english_address }}</div></h4>
                            <h4><div class="total_credits">邮政编码 {{ $address->zip }}</div></h4>
                            <h4><div class="total_credits">标志 {{ $address->flag }}</div></h4>
                        </address>

                        {{--
                       <a href="{{ url('admin/article/'.$article->id.'/edit') }}" class="btn btn-success">编辑</a>
                       <form action="{{ url('admin/article/'.$article->id) }}" method="POST" style="display: inline;">
                           {{ method_field('DELETE') }}
                           {{ csrf_field() }}
                           <button type="submit" class="btn btn-danger">删除</button>
                       </form>
                       --}}

                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection