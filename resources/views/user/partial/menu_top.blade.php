<li class="dropdown">
		<a href="#" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false" style="padding-right: 0px;">
			<span class="glyphicon glyphicon-user
			@if(Auth::check()){{ 'user-photo' }}@endif"
				  style="@if(Auth::check()) {{ "background-image:url('".(\Auth::user()->pic_url ? \App\Helpers\Utility::getStoragePath() . \Auth::user()->pic_url : 'img/no-avatar.png')."');" }} @endif"></span>
			@if(Auth::check()) Hello, {{ \Auth::user()->nickname }} @else {{ trans('user.your_account') }} @endif <span class="caret colorwhitecaret"></span>
		</a>
	<ul class="dropdown-menu colorwhite" role="menu" >
		<?php $menu=\Menu::top(true);?>
		@foreach ($menu as $item)
		    <li class="{{isset($item['class'])?$item['class']:''}} {{ Utility::active($item['route']) }}" >
				<a href='{{url($item['route'])}}'>
					@if (isset($item['icon']))
						<span class="{{$item['icon']}}"></span>
					@endif
					{{$item['text']}}
					@if (isset($item['cont'])&&$item['cont']>0)
					 <span class="badge">{{$item['cont']}}</span>
					@endif
				</a>
			</li>
				<li class="divider"></li>
{{--			@if(isset($item['divider']))<li class="divider"></li>@endif--}}
		@endforeach

		@if (auth()->check())
			<li class="divider"></li>
			<li>
				<form action="{!! url('logout') !!}" method="POST">
					{{ csrf_field() }}
					<button type="submit" class="btn btn-success btn-block">
						{{--<i class="glyphicon glyphicon-log-out"></i>&nbsp;--}}
						{{ trans('user.logout') }}
					</button>
				</form>
			</li>
		@endif
	</ul>
</li>