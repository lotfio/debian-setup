apt-get -y update
apt-get -y upgrade

# add essencial variables
PATH=/usr/sbin/:$PATH

# install sudo and add user
if ! command -v sudo
then
apt-get -y install sudo
/usr/sbin/useradd -p $(openssl passwd -crypt $DEBIAN_PASS) -m $DEBIAN_USER -s /bin/bash
echo "$DEBIAN_USER    ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/$DEBIAN_USER
fi

# install some usful tools
for pkg in install curl whois vim git unzip telnet sysstat screenfetch htop lsb-release ca-certificates apt-transport-https software-properties-common gnupg2; do
    apt-get install -y $pkg
done

# enable systat
sed -i 's/ENABLED="false"/ENABLED="true"/g' /etc/default/sysstat
systemctl start sysstat

# change welcome logo
rm /etc/motd
cp ./stubs/motd /etc/motd
sed -i 's/#PrintLastLog yes/PrintLastLog no/g' /etc/ssh/sshd_config