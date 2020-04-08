FROM php:7.4.4-fpm-alpine3.11

RUN apk add --no-cache libzip-dev openssl git

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install zip pdo pdo_mysql

RUN rm -rf /var/www/html

WORKDIR /var/www

#RUN git clone https://github.com/laravel/laravel.git /var/www

EXPOSE 9000
