#!/bin/bash 

# basic
source scripts/base.sh

# security
source scripts/security.sh

# nginx
source scripts/nginx.sh

# php
source scripts/security.sh

# clean
apt -y autoremove

reboot