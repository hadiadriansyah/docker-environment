FROM php:8.2-fpm

LABEL maintainer="hadiadriansyah21@gmail.com"
LABEL description="PHP 8.2 + Apache + Node.js + Composer"

RUN apt-get update && apt-get install -y \
    bash git unzip zip curl gnupg ca-certificates \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev libonig-dev libpq-dev \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        mysqli \
        mbstring \
        zip \
        gd \
        pdo_pgsql \
        pgsql \
        pcntl \
    && docker-php-ext-enable pdo_mysql pdo_pgsql

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Optional: Copy source code
# COPY ./src /var/www/html

# Permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD ["php-fpm"]