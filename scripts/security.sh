# secure ssh
port=2202
sed -i 's/#Port 22/Port $port/g' /etc/ssh/sshd_config
service ssh restart

# ufw firewall
apt -y install ufw

ufw default deny incoming
ufw allow $port
service ufw start
echo "y" | sudo ufw enable