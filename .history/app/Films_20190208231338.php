<?php


namespace App;


use Illuminate\Database\Eloquent\Model;


class Films extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'description', 'release_date', 'rating', 'ticket_price', 'country', 'genre', 'photo'
    ];

    protected $casts = [
        'genre' => 'array'
    ];
}