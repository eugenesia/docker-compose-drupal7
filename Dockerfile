# Drupal 7 web server with Drush.

# Base image name
FROM drupal:7

WORKDIR /tmp

# Install packages.
RUN apt-get update && apt-get install -y \
    wget

# Install composer.
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Install Drush 8 (master) as phar.
# RUN wget http://files.drush.org/drush.phar
# RUN mv drush.phar /usr/local/bin/drush && \
#     chmod +x /usr/local/bin/drush
RUN apt-get install -y drush

# Custom php.ini
COPY ./php.ini /usr/local/etc/php/

# SSH (for remote drush).
RUN DEBIAN_FRONTEND="noninteractive" apt-get install --yes openssh-server
RUN dpkg-reconfigure openssh-server

# Copy SSH keys for passwordless login to webserver container.
COPY ./id_rsa.pub /root/.ssh/authorized_keys

# Ports required for SSH (Drush) and Apache.
# Port 80: Apache httpd webserver
# Port 22: SSH daemon
EXPOSE 80 22

COPY ./web-run.sh /tmp

# Run SSH daemon.
CMD ["/tmp/web-run.sh"]

