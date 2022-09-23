apt -y update
apt -y upgrade

# secure ssh



# install some usful tools
apt -y install wget curl whois vim git unzip telnet sysstat screenfetch ufw

ufw allow 2244

# enable systat
sed -i 's/ENABLED="false"/ENABLED="true"/g' /etc/default/sysstat