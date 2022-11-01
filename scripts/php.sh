# requirements for php
if ! command -v php
then
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2

# add ppa repo
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list

# verify GPG
curl -fsSL  https://packages.sury.org/php/apt.gpg| gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg

# update & install php-fpm
apt-get -y update
apt-get -y install php8.1-fpm
apt-get -y install php8.1-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}
fi