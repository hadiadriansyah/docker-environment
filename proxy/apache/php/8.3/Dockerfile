FROM php:8.3-apache

LABEL maintainer="hadiadriansyah21@gmail.com"
LABEL description="PHP 8.3 + Apache + Node.js + Composer"

ARG DOC_ROOT=/var/www/html
ENV APACHE_DOCUMENT_ROOT=${DOC_ROOT}
ENV SERVER_NAME=localhost

COPY proxy/apache/vhost.tpl /vhost-template/vhost.tpl
COPY proxy/apache/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install dependencies
RUN apt-get update && apt-get install -y \
    gettext git unzip zip curl gnupg ca-certificates \
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

# Install Apache rewrite module
RUN a2enmod rewrite

# # Update DocumentRoot dan AllowOverride
# RUN sed -i "s|DocumentRoot /var/www/html|DocumentRoot ${APACHE_DOCUMENT_ROOT}|g" /etc/apache2/sites-available/000-default.conf \
#  && sed -i "/<Directory \/var\/www\/>/,/<\/Directory>/ s|AllowOverride None|AllowOverride All|" /etc/apache2/apache2.conf

# Install Node.js 22.x
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

# Install Composer
COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Optional: Copy source code
# COPY ./src /var/www/html

# Permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/entrypoint.sh"]