#!/bin/bash 

# env variables
source scripts/env.sh

# basic
source scripts/base.sh

# security
source scripts/security.sh

# nginx
source scripts/nginx.sh

# php
source scripts/php.sh

# fail2ban
source scripts/fail2ban.sh

# clean
apt -y autoremove

reboot