<?php

namespace app\Helpers;

/*
 * Antvel - App Menus Helper
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\Order;
use App\Product;

class Menu
{
    /**
     * [Menu Dashboard ].
     *
     * @param  bool para indicar el tipo de salida, json o array
     *
     * @return [json o array]
     *               Nota: el contenido del array interno de contener al menos route y text lo demas es opcional
     *               //[route,text,cont(para badge), divider, class, icon  ]
     */
    public static function dashboard($returnArray = false)
    {
        $menu = [
            ['route' => '/user/dashboard', 'text' => trans('user.dashboard'), 'icon' => 'glyphicon glyphicon-dashboard'],
            ['route' => '/user/profile', 'text' => trans('user.profile'), 'icon' => 'glyphicon glyphicon-user'],
        ];
        //Menu para empresas
        if (\Auth::user()->hasRole(['business'])) {
            $products = Product::where('user_id', \Auth::id())->get();
            $productsLowStock = 0;
            foreach ($products as $row) {
                if ($row->stock <= $row->low_stock) {
                    $productsLowStock++;
                }
            }

            $salesOpen = Order::where('seller_id', \Auth::user()->id)
                ->ofType('order')
                ->whereNotIn('status', ['cancelled', 'closed'])
                ->get()
                ->count();

            $menu = array_merge($menu, [
                ['route' => '/products/myProducts', 'text' => trans('user.your_products'), 'icon' => 'glyphicon glyphicon-briefcase', 'cont' => $productsLowStock],
                ['route' => '/orders/usersOrders', 'text' => trans('user.your_sales'), 'icon' => 'glyphicon glyphicon-piggy-bank', 'cont' => $salesOpen],
                ['route' => '/user/address', 'text' => trans('user.address_book'), 'icon' => 'glyphicon glyphicon-map-marker', 'divider' => 1],
            ]);
        }

        if (\Auth::user()->hasRole(['person'])) {
            $menu[] = ['route' => '/user/orders', 'text' => trans('user.your_orders'), 'icon' => 'glyphicon glyphicon-shopping-cart', 'divider' => 1, 'cont' => 0];
        }
        $salesOpen = Order::ofType('order')
            ->whereNotIn('status', ['cancelled', 'closed'])
            ->get()
            ->count();
        if (\Auth::user()->hasRole(['admin'])) {
            $menu[] = ['route' => '/user/buyerList', 'text' => trans('user.buyer'), 'icon' => '	glyphicon glyphicon-user', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/user/sellerList', 'text' => trans('user.seller'), 'icon' => '	glyphicon glyphicon-user', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/user/productList', 'text' => trans('user.product'), 'icon' => '	glyphicon glyphicon-ruble', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/user/subadminList', 'text' => trans('user.subadminList'), 'icon' => '	glyphicon glyphicon-ruble', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/orders/usersOrders', 'text' => trans('user.all_sales'), 'icon' => 'glyphicon glyphicon-piggy-bank', 'cont' => $salesOpen];
        }
        if (\Auth::user()->hasRole(['subadmin'])) {
            $menu[] = ['route' => '/user/buyerList', 'text' => trans('user.buyer'), 'icon' => '	glyphicon glyphicon-user', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/user/sellerList', 'text' => trans('user.seller'), 'icon' => '	glyphicon glyphicon-user', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/user/productList', 'text' => trans('user.product'), 'icon' => '	glyphicon glyphicon-ruble', 'divider' => 1, 'cont' => 0];
            $menu[] = ['route' => '/orders/usersOrders', 'text' => trans('user.all_sales'), 'icon' => 'glyphicon glyphicon-piggy-bank', 'cont' => $salesOpen];
        }
        if (\Auth::user()->isTrusted() && config('app.offering_free_products')) {
            $menu[] = ['route' => '/user/myFreeProducts', 'text' => trans('user.your_free_products'), 'icon' => 'glyphicon glyphicon-star'];
        }

        return $returnArray ? $menu : json_encode($menu);
    }

    /**
     * [Menu Top ].
     *
     * @param  bool para indicar el tipo de salida, json o array
     *
     * @return [json o array]
     *               Nota: el contenido del array interno de contener al menos route y text lo demas es opcional
     *               //[route,text,cont(para badge), divider, class, icon  ]
     *               Este menu carga el menu del Dashboard
     */
    public static function top($returnArray = false)
    {
        if (\Auth::guest()) { // invidados
            $menu = [
                ['route' => '/', 'text' => trans('user.login'), 'divider' => 1],
                ['route' => '/register', 'text' => trans('user.register')],
            ];
        } else {  // logeado
            $menu = self::dashboard(true);

            //-- Web Panel(Only for admim) --
            if (\Auth::check() && \Auth::user()->isAdmin()) {
                $menu = array_merge($menu, [
                    ['route' => '/wpanel', 'text' => trans('user.wpanel'), 'icon' => 'glyphicon glyphicon-cog', 'divider' => 1],
                ]);
            }
        }

        return $returnArray ? $menu : json_encode($menu);
    }

    /**
     * [Menu backend ].
     *
     * @param  bool para indicar el tipo de salida, json o array
     *
     * @return [json o array]
     *               Nota: el contenido del array interno de contener al menos route y text lo demas es opcional
     *               //[route,text,cont(para badge), divider, class, icon  ]
     */
    public static function backend($returnArray = false)
    {
        //Menu para empresas
        if (\Auth::user()->hasRole(['business', 'admin'])) {
            $menu = [
                ['route' => '/wpanel',            'text' => trans('user.dashboard'),              'icon' => 'glyphicon glyphicon-dashboard'],
                ['route' => '/wpanel/profile',    'text' => trans('company.store_config'),        'icon' => 'glyphicon glyphicon-cog'],
                ['route' => '/wpanel/categories', 'text' => trans('categories.product_category'), 'icon' => 'glyphicon glyphicon-tasks'],
                ['route' => '/wpanel/features',   'text' => trans('features.product_features'),   'icon' => 'glyphicon glyphicon-th-list'],
            ];
        }

        return $returnArray ? $menu : json_encode($menu);
    }

    /**
     * [Menu help ].
     *
     * @param  bool para indicar el tipo de salida, json o array
     *
     * @return [json o array]
     *               Nota: el contenido del array interno de contener al menos route y text lo demas es opcional
     *               //[route,text,cont(para badge), divider, class, icon  ]
     */
    public static function help($returnArray = false)
    {
        //Menu para empresas

            $menu = [
                // ['route' =>'#',      'text'=> trans('globals.faq'),   ],
                ['route' => '/about', 'text' => trans('company.about_us'),'target' => ''],
                ['route' => '/refunds', 'text' => trans('company.refund_policy'),'target' => ''],
                ['route' => '/privacy', 'text' => trans('company.privacy_policy'),'target' => '_blank'],
                ['route' => '/terms', 'text' => trans('company.terms_of_service'), 'divider' => 1,'target' => '_blank'],
                ['route' => '/otherPolicies', 'text' => trans('about.other_policies'),'target' => '_blank'],
                ['route' => '/userAgreement', 'text' => trans('about.user_agreement'),'target' => '_blank'],
                ['route' => '/contactus', 'text' => trans('about.contact_us'),'target' => ''],
            ];
        return $returnArray ? $menu : json_encode($menu);
    }
}
