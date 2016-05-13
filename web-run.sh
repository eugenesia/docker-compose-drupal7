#!/bin/bash
#
# Run 2 processes using this script file. Running 2 is not usually possible
# without a script.
#


# Make required dir, and run SSHD.
mkdir /var/run/sshd
/usr/sbin/sshd &

# Last foreground script has to keep running else container will exit.
/usr/sbin/apache2 -DFOREGROUND

