#!/bin/bash

set -x
NEWUSER=$1
PASSWORD=skyline
MAILGRP=mail
useradd -m -G $MAILGRP $NEWUSER
echo "$NEWUSER:$PASSWORD"|chpasswd
#su - $NEWUSER -c "echo $NEWUSER:{PLAIN}$PASSWORD:$UID:$GID::$HOME >> /tmp/users "
#cat /tmp/users >> /etc/dovecot/users
