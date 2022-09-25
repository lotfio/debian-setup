#!/bin/bash 

# basic
source scripts/base.sh

# security
source scripts/security.sh

# nginx
source scripts/nginx.sh

# php
source scripts/php.sh

# clean
apt -y autoremove

reboot