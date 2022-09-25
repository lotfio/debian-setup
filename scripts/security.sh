# secure ssh
sed -i 's/#Port 22/Port 2214/g' /etc/ssh/sshd_config
service ssh restart

# ufw firewall
apt -y install ufw

ufw default deny incoming
ufw allow 2214
ufw allow https
echo "y" | ufw enable
systemctl start ufw