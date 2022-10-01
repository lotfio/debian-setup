# requirements for php
if ! command -v php
then
apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2

# add ppa repo
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list

# verify GPG
curl -fsSL  https://packages.sury.org/php/apt.gpg| sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg

# update & install php-fpm
apt -y update
apt -y install php8.1-fpm 
apt -y install php8.1-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}
fi