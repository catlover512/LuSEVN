<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'stock_id',
        'price',
        'quantity',
        'type',
        'closed_at',
    ];

    // Quan hệ với Stock
    public function stock()
    {
        return $this->belongsTo(Stock::class);
    }

    // Quan hệ với User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
