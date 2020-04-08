#!/bin/sh

#php artisan key:generate
php artisan migrate

php-fpm
