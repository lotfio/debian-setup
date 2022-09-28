apt -y update
apt -y upgrade

# install sudo and add user
apt -y install sudo
/usr/sbin/useradd -p $(openssl passwd -crypt $DEBIAN_PASS) -m $DEBIAN_USER -s /bin/bash
echo "$DEBIAN_USER    ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/$DEBIAN_USER

# install some usful tools
apt -y install wget curl whois vim git unzip telnet sysstat screenfetch htop

# enable systat
sed -i 's/ENABLED="false"/ENABLED="true"/g' /etc/default/sysstat
systemctl start sysstat

# change welcome logo
rm /etc/motd
cp ./stubs/motd /etc/motd
sed -i 's/#PrintLastLog yes/PrintLastLog no/g' /etc/ssh/sshd_config