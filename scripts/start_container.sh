#!/bin/bash

set -x
su - $NEWUSER -c "echo $NEWUSER:{PLAIN}$PASSWORD:$UID:$GID::$HOME >> /tmp/users "
cat /tmp/users >> /etc/dovecot/users
/usr/sbin/dovecot -F

