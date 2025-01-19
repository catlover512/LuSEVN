<?php

// app/Models/StockOrder.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockOrder extends Model
{
    use HasFactory;

    protected $fillable = [
        'state',        // Trạng thái lệnh (true/false)
        'stock_id',     // ID cổ phiếu
        'old_price',    // Giá cũ
        'new_price',    // Giá mới
        'admin_id',     // Ai điều chỉnh
    ];

    /**
     * Liên kết tới Stock (cổ phiếu được điều chỉnh).
     */
    public function stock()
    {
        return $this->belongsTo(Stock::class);
    }

    /**
     * Liên kết tới User (admin thực hiện điều chỉnh).
     */
    public function admin()
    {
        return $this->belongsTo(User::class, 'admin_id');
    }
}

