#!/bin/bash
#
# Start SSH and Apache daemons.
#


# Fix SSH error 'missing privilege separation directory'.
mkdir /var/run/sshd

# Runs the SSH daemon in background.
/usr/sbin/sshd &

# Last command has to run in the foreground, else container will exit.
/usr/sbin/apache2 -DFOREGROUND

