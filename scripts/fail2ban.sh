# install fail2ban
if ! command -v fail2ban
then
apt-get -y install fail2ban

# copy ban rules
rm -r /etc/fail2ban/jail.d/*
cp ./stubs/fail2ban/filters/* /etc/fail2ban/filter.d/
cp ./stubs/fail2ban/rules/* /etc/fail2ban/jail.d/

systemctl start fail2ban
systemctl enable fail2ban

# to unban all    : fail2ban-client unban --all 
# to check status : fail2ban-client status (jail)
fi