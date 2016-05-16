#!/bin/bash
#
# Start SSH and Apache daemons.
#

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
# See https://github.com/fedora-cloud/Fedora-Dockerfiles/blob/master/apache/run-apache.sh
rm -rf /run/httpd/* /tmp/httpd*

# Fix SSH error 'missing privilege separation directory'.
mkdir /var/run/sshd

# Runs the SSH daemon in background.
/usr/sbin/sshd &

# Last command has to run in the foreground, else container will exit.
/usr/sbin/apache2 -DFOREGROUND

