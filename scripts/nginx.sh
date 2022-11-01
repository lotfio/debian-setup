# install nginx
if ! command -v nginx
then

# verify GPG
curl -O https://nginx.org/keys/nginx_signing.key && apt-key add ./nginx_signing.key

# add ppa repo
echo "deb http://nginx.org/packages/debian $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx-stable.list


# update & install nginx
apt-get -y update
apt-get -y install nginx

# update nginx config file
wget https://github.com/h5bp/server-configs-nginx/archive/refs/tags/4.2.0.tar.gz

tar -xf 4.2.0.tar.gz && cd server-configs-nginx-4.2.0

rm LICENSE.txt CHANGELOG.md README.md &&cp -rf * /etc/nginx/

rm -rf server-configs-nginx-4.2.0 && rm 4.2.0.tar.gz

mkdir /var/www && touch index.php && chown -R www-data:www-data /var/www

echo "<?=phpinfo()?>" >> /var/www/index.php

# start nginx
systemctl start nginx

# install certbot
apt-get -y install certbot python3-certbot-nginx
fi