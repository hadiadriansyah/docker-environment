FROM php:8.3-cli

WORKDIR /app

RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

RUN composer global require laravel/installer

ENV PATH="/root/.composer/vendor/bin:${PATH}"

CMD [ "laravel", "--version" ]