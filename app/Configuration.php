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

class Configuration extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'configuration';

    protected $fillable = ['name'];

    public static function getvisitor(){
        $count = self::where('name','visitor')->first();
        return $count->value;
    }
}
