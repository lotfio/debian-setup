# install nginx
if ! command -v nginx
then

# verify GPG
curl -O https://nginx.org/keys/nginx_signing.key && apt-key add ./nginx_signing.key

# add ppa repo
echo "deb http://nginx.org/packages/debian $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx-stable.list


# update & install nginx
apt -y update
apt -y install nginx

# update nginx config file
sed -i 's/user  nginx/user  www-data/g' /etc/nginx/nginx.conf
mkdir /var/www && chown -R www-data:www-data /var/www

# start nginx
systemctl start nginx

# install certbot
apt -y install certbot python3-certbot-nginx
fi