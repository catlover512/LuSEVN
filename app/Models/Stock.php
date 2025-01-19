<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'symbol',
        'price',
        'unit',
        'type',
        'open_time',
        'close_time',
    ];

    // Quan hệ với StockOrder
    public function stockOrders()
    {
        return $this->hasMany(StockOrder::class);
    }

    // Quan hệ với StockTransaction
    public function transactions()
    {
        return $this->hasMany(StockTransaction::class);
    }
}

