# Drupal 7 web server with Drush.

# Base image name
FROM drupal:7

WORKDIR /tmp

# Install packages.
RUN apt-get update && apt-get install -y \
    wget

# Install composer.
RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

# Install Drush 8 (master) as phar.
RUN wget http://files.drush.org/drush.phar
RUN mv drush.phar /usr/local/bin/drush && chmod +x /usr/local/bin/drush

# Custom php.ini
COPY ./php.ini /usr/local/etc/php/

# Ports required for SSH (Drush) and Apache.
EXPOSE 80 443 22

