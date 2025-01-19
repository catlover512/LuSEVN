<?php

// database/seeders/DatabaseSeeder.php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Stock;
use App\Models\StockTransaction;
use App\Models\WalletTransaction;
use App\Models\StockOrder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Tạo người dùng và admin
        User::factory()->count(10)->create();
        User::factory()->state(['role' => 'admin'])->count(3)->create();

        // Tạo ví tiền
        Wallet::factory()->count(10)->create();

        // Tạo cổ phiếu
        Stock::factory()->count(20)->create();

        // Tạo giao dịch chứng khoán
        StockTransaction::factory()->count(50)->create();

        // Tạo giao dịch ví
        WalletTransaction::factory()->count(30)->create();

        // Tạo các lệnh điều chỉnh giá
        StockOrder::factory()->count(10)->create();
    }
}
