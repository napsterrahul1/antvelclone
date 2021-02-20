@extends('layouts.wpanel')
@section('title')@parent- {{ trans('company.store_config') }} @stop
@section('panel_left_content')
@parent
@stop
@section('center_content')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.min.js"></script>
    {{--<script src="{!! asset('imsky/holder.js') !!}"></script>--}}
<script>
    Holder.addTheme("dark", {
        background: "#000",
        foreground: "#aaa",
        size: 11,
        font: "Monaco",
        fontweight: "normal"
    });
</script>
    <h1>Dashboard</h1>

    <div class="row placeholders">
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
    </div>
   
@stop

@section('script')
    @parent
@stop
