#!/bin/bash
set -e

if [ $USERNAME ]; then

    # Create user
    mkdir -p /home/developer
    id -u $USERNAME &>/dev/null || useradd --non-unique --uid $UNIX_UID --home /home/developer $USERNAME
    chown $USERNAME:$USERNAME /home/developer

    # Replace www-data by $USERNAME
    sed --in-place --expression="s/www-data/$USERNAME/g" /usr/local/etc/php-fpm.d/www.conf

fi

exec "$@"
