FROM php:5.6-apache

LABEL maintainer="hadiadriansyah21@gmail.com"
LABEL description="Docker image for legacy PHP 5.6 applications"

ARG DOC_ROOT=/var/www/html
ENV APACHE_DOCUMENT_ROOT=${DOC_ROOT}
ENV SERVER_NAME=localhost

COPY /apache/vhost.tpl /vhost-template/vhost.tpl
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    echo 'APT::Get::AllowUnauthenticated "true";' > /etc/apt/apt.conf.d/99allow-unauth

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    git unzip zip curl \
    libjpeg62-turbo-dev libpng-dev libfreetype6-dev \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysql mysqli mbstring

RUN a2enmod rewrite

# # Update DocumentRoot dan AllowOverride
# RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

RUN curl -sS https://getcomposer.org/installer | php -- --1 \
 && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html

# Optional: Copy source code
# COPY ./src /var/www/html

# Permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/entrypoint.sh"]