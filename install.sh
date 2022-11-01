#!/bin/bash 

# env variables
source scripts/env.sh

# basic
source scripts/base.sh

# nginx
source scripts/nginx.sh

# php
source scripts/php.sh

# fail2ban
source scripts/fail2ban.sh

# mysql
source scripts/mysql.sh

# security
source scripts/security.sh

# clean
apt-get -y autoremove

systemctl reboot