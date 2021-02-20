<?php

namespace app;

/*
 * Antvel - Business Model
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\Eloquent\Model;
use App\User;

class Pincode extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'pincodes';
    public $timestamps = false;
    public $primaryKey = 'id';
    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['id','country_id','state_id','city_id','pincode','area'];
    
}
