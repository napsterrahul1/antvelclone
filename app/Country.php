<?php

namespace app;

/*
 * Antvel - Comment Model
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\ActionType;
use App\Eloquent\Model;
use App\Notice;

class Country extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'Countries';

    protected $fillable = ['name'];

    //protected $appends = [ 'source_type', 'action_type' ];

    //protected $hidden = [ 'action', 'source' ];

//    public function save(array $options = [])
//    {
//        $saved = parent::save($options);
//        if ($saved) {
//            $data = [];
//            if (is_array($this->original)) {
//                $data = $data + $this->original;
//            }
//            if (is_array($this->attribute)) {
//                $data = $data + $this->attribute;
//            }
//            $data = $data + $options;
//            //here we validate the type and return the source reference
//            switch (ActionType::find($data['name'])->source_type) {
//                case 'order':
//                    $action = 3;
//                    $order = Order::find($data['source_id']);
//                    if ($order) {
//                        $users = [$order->user_id, $order->seller_id];
//                    }
//                break;
//            }
//            if (isset($users)) {
//                Notice::create([
//                'action_type_id' => $action,
//                'sender_id'      => $data['user_id'],
//                'user_ids'       => $users,
//                'source_id'      => $data['source_id'],
//            ]);
//            }
//        }
//    }

//    public function action()
//    {
//        return $this->hasOne('App\ActionType', 'id', 'action_type_id');
//    }

   
}
