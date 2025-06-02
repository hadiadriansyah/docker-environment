FROM php:8.3-fpm

LABEL maintainer="hadiadriansyah21@gmail.com"
LABEL description="Base Docker image for web development with PHP 8.3 and PHP-FPM, including Composer"

RUN apt-get update && apt-get install -y \
    git unzip zip curl \
    libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev libpq-dev \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        mysqli \
        mbstring \
        zip \
        gd \
        pdo_pgsql \
        pgsql \
    && docker-php-ext-enable pdo_mysql pdo_pgsql

WORKDIR /var/www/html

# COPY projects/project_name/src/ /var/www/html/ # Uncomment this line to copy your project files into the container

COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

RUN chown -R www-data:www-data /var/www/html
# RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html/storage /var/www/html/bootstrap/cache

