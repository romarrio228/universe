@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-body" id="vue-user">
                        <form action="" method="POST" role="form">
                        <!--<legend>{{ Auth::user()->name }}</legend>   暂时不要这行? -->

                            <div class="form-group">
                                <label for="countries">国家</label>
                                <!-- 绑定country_id，随着选择不同的国家而改变 -->
                                <select name="countries" id="countries" v-model="country_id">
                                    @foreach($countries as $country)
                                        <option  value="{{$country->id}}">
                                            {{ $country->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="provinces">省份</label>
                                <select name="provinces" id="provinces" v-model="province_id">
                                    @foreach($provinces as $province)
                                        <option v-if="country_id == {{ $province->country_id }}" value="{{$province->id}}">
                                            {{ $province->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="cities">城市</label>
                                <select name="cities" id="cities" v-model="city_id">
                                    @foreach($cities as $city)
                                        <option v-if="province_id == {{ $city->province_id }}" value="{{$city->id}}">
                                            {{ $city->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="districts">县区</label>
                                <select name="districts" id="districts">
                                    @foreach($districts as $district)
                                        <option v-if="city_id == {{ $district->city_id }}" value="{{$district->id}}">
                                            {{ $district->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')

    <script>
        new Vue({
            el:'#vue-user',
            data: {
                country_id:$('#countries option:selected').val(),
                province_id:$('#provinces option:selected').val(),
                city_id:$('#cites option:selected').val()
            }
        })
    </script>
@endsection