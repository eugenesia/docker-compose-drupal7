# MySQL server.

# Base image name
FROM php:5-apache

# Mandatory to set password for username 'root'
ENV MYSQL_ROOT_PASSWORD='root'

# Install extensions required for Drupal.
RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  && docker-php-ext-install -j$(nproc) iconv mcrypt \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd

RUN echo "Test file <?php print 'Hello world'; ?>" > /var/www/html/index.php

# Custom php.ini
COPY ./php/php.ini /usr/local/etc/php/

