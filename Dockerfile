# Drupal 7 web server with Drush.

# Base image name
FROM drupal:7

# Install packages.
RUN apt-get update && apt-get install -y \
    wget

# Install Drush 8 (master) as phar.
RUN wget http://files.drush.org/drush.phar
RUN mv drush.phar /usr/local/bin/drush && chmod +x /usr/local/bin/drush

# Custom php.ini
COPY ./php.ini /usr/local/etc/php/

# Ports required for SSH (Drush) and Apache.
EXPOSE 80 443 22

