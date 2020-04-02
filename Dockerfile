FROM php:7.4.4-fpm-alpine3.11

WORKDIR /var/www
RUN apk add --no-cache libzip-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install zip pdo pdo_mysql

COPY ./app .

EXPOSE 9000
