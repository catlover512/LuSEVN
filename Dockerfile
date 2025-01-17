# 1. Sử dụng image PHP chính thức với FPM
FROM php:8.2-fpm

# 2. Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    zip unzip git curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# 3. Cài đặt Composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

# 4. Cài đặt Node.js và npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# 5. Tạo thư mục làm việc
WORKDIR /var/www

# 6. Sao chép mã nguồn ứng dụng vào container
COPY . .

# 7. Tạo các thư mục storage và bootstrap/cache nếu chúng không tồn tại
RUN mkdir -p /var/www/storage /var/www/bootstrap/cache

# 8. Cài đặt dependencies của Laravel và build frontend
RUN composer install --no-dev --optimize-autoloader
RUN npm install && npm run build

# 9. Thiết lập quyền cho các thư mục cần ghi (với quyền root)
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# 10. Mở cổng 8000
EXPOSE 8000

# 11. Lệnh khởi động ứng dụng
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
