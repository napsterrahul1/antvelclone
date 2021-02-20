@extends('layouts.master')

@section('page_class')@parent- {{ trans('about.contact_us') }}@endsection

{{-- NAVBAR --}}
@section('navigation')
  @include('partial.navigation_basic')
@endsection

{{-- CONTENT --}}
@section('content')
<div class="container-fluid">
  <div class="row col-md-12">
    <div class="panel panel-default">

      <div class="panel-heading clearfix">
        <h4 class="panel-title pull-left" style="padding-top: 7.5px;"><span class="glyphicon glyphicon-envelope"></span> {{trans('about.contact')}}</h4>
      </div>
      <div class="panel-body">

        <div class="col-sm-12 col-md-6 col-lg-4">
          @include('about.contact_form')
        </div>
        <div class="col-sm-12 col-md-6 col-lg-8">
                    {{--@include('about.info')--}}
          {{--@include('about.map')--}}
<br/>

          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"> </li>
              <li data-target="#myCarousel" data-slide-to="2"> </li>
              <li data-target="#myCarousel" data-slide-to="3"> </li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <img src="{!! asset('img/a.png') !!}" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>Talegaon</h3>
                  <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                </div>
              </div>

              <div class="item">
                <img src="{!! asset('img/b.jpg') !!}" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>Pune</h3>
                  <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                </div>
              </div>

              <div class="item">
                <img src="{!! asset('img/a.png') !!}" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                  <h3>mumbai</h3>
                  <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                </div>
              </div>

              <div class="item">
                <img src="{!! asset('img/b.jpg') !!}" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                  <h3>India</h3>
                  <p>The atmosphere in India has a touch of Florence and Venice.</p>
                </div>
              </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
{{-- Pie de pagina --}}
@section('footer')
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    .carousel-inner > .item > img,
    .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
    }
  </style>
@parent
@endsection
{{-- Angular --}}
@section('before.angular') @endsection
{{-- Javascript --}}
@section('scripts')
@parent
@endsection