#!/bin/bash
#update apt
apt-get update

#install ntp package
apt-get install ntp

grep -v 'pool' /etc/ntp.conf
cat /etc/ntp.conf | grep -v ^pool > /etc/ntp.conf.bak

#restart systemctl ntp
systemctl restart ntp
* * * * *  $(realpath ntp_verify.sh)
