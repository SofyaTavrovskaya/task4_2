#!/bin/bash
#update apt
apt-get update

#install ntp package
apt-get install ntp

grep -v 'pool' /etc/ntp.conf
echo "ua.pool.ntp.org" >> /etc/ntp.conf

#restart systemctl ntp
systemctl restart ntp
* * * * *  ntp_verify.sh
