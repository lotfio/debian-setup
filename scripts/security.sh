# secure ssh
if ! command -v ufw
then
sed -i "s/#Port 22/Port $SSH_PORT/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

# ufw firewall
apt-get -y install ufw

ufw default deny incoming
ufw allow $SSH_PORT
ufw allow https
echo "y" | ufw enable
systemctl start ufw

# restart ssh
systemctl restart ssh
fi