<?php

namespace app\Http\Controllers;

/*
 * Antvel - Home Controller
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\City;
use App\FreeProduct;
use App\Helpers\productsHelper;
use App\Helpers\Utility;
use App\Http\Controllers\Controller;
use App\Order;
use App\Pincode;
use App\Product;

class HomeController extends Controller
{
    public function index($catid =1)
    {

       $panel = [
            'center' => [
                'width' => 10,
            ],
            'left' => [
                'width' => 2,
                'class' => 'home-no-padding',
            ],
        ];

        $helperProd = new productsHelper();
        $carousel = $helperProd->suggest('carousel');
        $viewed = $helperProd->suggest('viewed', 8 , $catid);
        $categories = $helperProd->suggest('categories',$catid);
        $purchased = $helperProd->suggest('purchased');

        $suggestion = [
            'carousel'   => $carousel,
            'viewed'     => $viewed,
            'categories' => $categories,
            'purchased'  => $purchased,
        ];
        $helperProd->resetHaystack(); //reseting session id validator

        $events = [];
        if (config('app.offering_free_products')) {
            $events = FreeProduct::getNextEvents([
                'id',
                'description',
                'min_participants',
                'max_participants',
                'participation_cost',
                'start_date',
                'end_date',
            ], 4, date('Y-m-d'));
        }

        $tagsCloud = ProductsController::getTopRated(0, 20, true, $catid);

        $allWishes = '';
        $user = \Auth::user();
        if ($user) {
            $allWishes = Order::ofType('wishlist')->where('user_id', $user->id)->where('description', '<>', '')->get();
        }

        $i = 0; //carousel implementation
        $jumbotronClasses = ['jumbotron-box-left', 'jumbotron-box-right']; //carousel implementation

        $banner = [
            asset('/').'img/banner/01.png',
            asset('/').'img/banner/02.png',
            asset('/').'img/banner/03.png',
            asset('/').'img/banner/04.png',
        ];

        // $this->createTags();


//        rahul new code for filter

        /**
         * $search
         * this var contains the information typed into search box.
         *
         * @var [type]
         */
        $products = Product::select('id', 'category_id', 'name', 'price', 'description', 'condition', 'brand', 'rate_val', 'type', 'features', 'parent_id', 'tags')
            ->where('product_status','approved')
            ->free()
            ->actives()
            ->orderBy('rate_val', 'desc');

        /**
         * $all_products
         * it is the product list refined, which will be used in each filter process below.
         *
         * @var [type]
         */
        $all_products = $products->get();

        $suggestions = [];
        if (count($all_products) < 28) {
            $suggestions = productsHelper::suggest('my_searches');
        }

        /*
         * $filters
         * it is the refine menu array, which is used to build the search options
         * @var [type]
         */
        $refine = [];
        $category_id = 'mothers';
        $categories = \Cache::remember('categories_'.$category_id, 25, function () use ($category_id) {
            return Category::select('id', 'name')
                ->childsOf($category_id)
                ->actives()
                ->get()
                ->toArray();
        });

        $filters = productsHelper::countingProductsByCategory($all_products, $categories);

        //condition
        $filters['conditions'] = array_count_values($all_products->pluck('condition')->toArray());

        //brand filter
        $filters['brands'] = array_count_values($all_products->pluck('brand')->toArray());

        //features
        $features = [];
        $irrelevant_features = ['images', 'dimensions', 'weight', 'brand']; //this has to be in company setting module
        foreach ($all_products->pluck('features') as $feature) {
            $feature = array_except($feature, $irrelevant_features);
            foreach ($feature as $key => $value) {
                $features[$key][] = $value;
            }
        }

        //products by feature
        foreach ($features as $key => $value) {
            foreach ($features[$key] as $row) {
                if (!is_array($row)) {
                    $filters[$key][$row] = !isset($filters[$key][$row]) ? 1 : $filters[$key][$row] + 1;
                }
            }
        }



        return view('home', compact('panel','refine','filters','all_products', 'suggestion', 'allWishes', 'events', 'tagsCloud', 'jumbotronClasses', 'i', 'banner'));
    }

    private function createTags()
    {
        $product = Product::select(['id', 'name'])->get();

        foreach ($product as $value) {
            $prod = Product::find($value->id);

            $prod->tags = str_replace(' ', ',', $value->name);

            $prod->save();
        }
    }
    public function getcitybypincode()
    {
        $pincode = \Illuminate\Support\Facades\Input::get('pincode_id');
        $city = Pincode::find($pincode);
        $cityname = City::find($city->city_id);
        if($cityname)
        return $cityname;
        else
           return $city;
    }
}
