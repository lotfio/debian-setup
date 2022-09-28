# secure ssh
sed -i "s/#Port 22/Port $SSH_PORT/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
service ssh restart

# ufw firewall
apt -y install ufw

ufw default deny incoming
ufw allow $SSH_PORT
ufw allow https
echo "y" | ufw enable
systemctl start ufw