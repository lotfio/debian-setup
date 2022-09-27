# nginx GPG
wget -O- https://nginx.org/keys/nginx_signing.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg

# add ppa repo
echo deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian `lsb_release -cs` nginx | sudo tee /etc/apt/sources.list.d/nginx-stable.list

# use own nginx 
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | sudo tee /etc/apt/preferences.d/99nginx

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