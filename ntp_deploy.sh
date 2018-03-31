#!/bin/bash
IS_NTP_INSTALLED=$(dpkg -l ntp | grep ii |wc -l)
if [ $IS_NTP_INSTALLED = 0 ]
then
echo "Updating apt"
apt update
echo "Installing ntp"
apt install ntp -y -q
fi

echo "Creating bak"
cat /etc/ntp.conf | grep -v ^pool > /etc/ntp.conf.bak
echo "Updating it with the server"
echo pool ua.pool.ntp.org >> /etc/ntp.conf.bak
echo "Recreating config"
cp -f /etc/ntp.conf.bak /etc/ntp.conf

#restart systemctl ntp
echo "Restarting ntp"
systemctl restart ntp
echo "Updating cron"
(crontab -l ; echo "* * * * *  $(realpath ntp_verify.sh)") | crontab
