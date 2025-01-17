<<<<<<< HEAD
# Sử dụng image PHP chính thức
FROM php:8.2-fpm

# Cài đặt các extension cần thiết cho Laravel
RUN apt-get update && apt-get install -y \
    zip unzip curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Cài đặt Composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

# Cài đặt Node.js và npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Tạo thư mục làm việc
WORKDIR /var/www

# Sao chép mã nguồn vào container
COPY . .

# Cài đặt các gói Composer và npm
RUN composer install --no-dev --optimize-autoloader
RUN npm install && npm run build

# Thiết lập quyền cho thư mục storage và cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Mở cổng 8000
EXPOSE 8000

# Lệnh khởi chạy Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
=======
# Sử dụng image PHP chính thức
FROM php:8.2-fpm

# Cài đặt các extension cần thiết cho Laravel
RUN apt-get update && apt-get install -y \
    zip unzip curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Cài đặt Composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

# Cài đặt Node.js và npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Tạo thư mục làm việc
WORKDIR /var/www

# Sao chép mã nguồn vào container
COPY . .

# Cài đặt các gói Composer và npm
RUN composer install --no-dev --optimize-autoloader
RUN npm install && npm run build

# Thiết lập quyền cho thư mục storage và cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Mở cổng 8000
EXPOSE 8000

# Lệnh khởi chạy Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
>>>>>>> origin/main
