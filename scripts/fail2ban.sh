# install fail2ban
apt install fail2ban

# copy ban rules
rm -r /etc/fail2ban/jail.d/*
cp ./stubs/fail2ban/filters/* /etc/fail2ban/filter.d/
cp ./stubs/fail2ban/rules/* /etc/fail2ban/jail.d/

systemctl start fail2ban
systemctl enable fail2ban
