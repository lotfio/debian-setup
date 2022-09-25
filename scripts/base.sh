apt -y update
apt -y upgrade

# install sudo and add user
apt -y install sudo
user=""
pass=""
/usr/sbin/useradd -p $(openssl passwd -crypt $pass) -m $user
echo "$user    ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/$user

# install some usful tools
apt -y install wget curl whois vim git unzip telnet sysstat screenfetch htop

# enable systat
sed -i 's/ENABLED="false"/ENABLED="true"/g' /etc/default/sysstat

