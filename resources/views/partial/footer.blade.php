<div class="container">
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4 menu">
            <?php $menu=\Menu::help(true); ?>
            <h3>{{ trans('globals.company_label') }}</h3>
            <ul>
                @foreach ($menu as $item)
                    <li><a href = '{{ url('/').$item['route'] }}' target="{!! $item['target'] !!}">{{ $item['text'] }}</a></li>
                @endforeach
            </ul>
        </div>

        <div class="col-xs-4 col-sm-4 col-md-4 menu">
            <?php $menu=\Menu::help(true); ?>
            <h3> Contact </h3>
            <ul>
                    <li><a href = '{{ url('contact') }}'>Repair My Pc</a></li>
                    <li>
                        <a style="font-size: 0.8em;">
                            <span class="glyphicon glyphicon-phone-alt"></span>
                            <span class="home-info-bar-text">{{ $main_company['phone_number'] }}</span>
                        </a>
                    </li>
                    <li>
                        <a href="mailto:{{ $main_company['sales_email'] }}">
                            <span class="glyphicon glyphicon-envelope"></span>
                            <span>{{ $main_company['sales_email'] }}</span>
                        </a>

                    </li>
            </ul>
        </div>

        <div class="col-xs-4 col-sm-4 col-md-4 menu">
            <h3>{{ trans('globals.social_label') }}</h3>
            <ul>
                <li><a href="https://www.facebook.com/{{ $main_company['facebook'] }}" target="_blank">{{ trans('globals.facebook_label') }}</a></li>
                <li><a href="https://twitter.com/{{ $main_company['twitter'] }}" target="_blank">{{ trans('globals.twitter_label') }}</a></li>
                <li><a href="https://plus.google.com/u/0/{{ $main_company['google_plus'] }}" target="_blank">{{ trans('globals.google_label') }}</a></li>
            </ul>
        </div>

        {{--<div class="col-xs-4 col-sm-4 col-md-4 newsletter" ng-controller = "NewslettersCtrl">--}}
{{--            @if (\Auth::user())--}}
{{--                <p>{{ trans('globals.reach_us_msg') }}</p>--}}
                {{--<p><strong><a href="{!! url('contact') !!}"><span class="glyphicon glyphicon-envelope"></span>&nbsp;{{ trans('globals.send_a_email_label') }}</a></strong></p>--}}
            {{--@else--}}
                {{--<div class="signup clearfix">--}}
                    {{--<p>{{ trans('user.newsletter_sign_up') }}</p>--}}
                    {{--<form>--}}
                        {{--<input type="text" ng-model = "newsEmail"  class = "form-control input-sm" placeholder = "{{ trans('user.your_email_address_label') }}">--}}
                        {{--<input type="button" ng-click = "save()" value = "{{ trans('user.sign_up_label') }}">--}}
                    {{--</form>--}}
                {{--</div>--}}

            {{--@endif--}}

        {{--</div>--}}
        @if (\Auth::user())
        @if((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin'))
        <div class="row" style="float: right">
            <?php $count = \App\Configuration::getvisitor()?>
            <div class="incremental-counter" data-value="{!! $count !!}" style="padding-right: 20px;"></div>
        </div>
        @endif
        @endif
    </div>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="{!! asset('js/jquery.incremental-counter.js') !!}"></script>
    <link href="{!! asset('js/jquery.incremental-counter.css') !!}" rel="stylesheet" type="text/css">
    <script>
        $(".incremental-counter").incrementalCounter({
            "digits": 6
        });
    </script>


    <div class="row credits">
        <div class="col-md-12">
            {{ trans('globals.power_by_label') }}&nbsp;<a href="http://talegaon.co.in">E-commerce</a>
        </div>
    </div>

</div>

@section('scripts')
    @parent
    <script>
        (function(app){
            app.controller('NewslettersCtrl', function($scope, $window, notify)
            {
                $scope.newsEmail = '';
                $scope.save = function()
                {
                    if ($scope.newsEmail.trim() != '') {
                        $window.location.href = base_url + '/register?email='+$scope.newsEmail;
                    } else {
                        notify({ duration:5000, messageTemplate: '<strong>{{ trans('globals.validation_error_label') }}</strong><br><br><p>{{ trans('globals.newsletter_email_error') }}</p>', classes: 'alert alert-danger' });
                    }
                };
            });
        })(angular.module("AntVel"));
    </script>
@stop