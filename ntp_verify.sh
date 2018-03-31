#!/bin/bash

systemctl is-active --quiet ntp
if [ $? != 0 ]
then
echo "NOTICE: ntp is not running"
systemctl start ntp
fi

cmp -s /etc/ntp.conf /etc/ntp.conf.bak
if [ $? != 0 ]
then
echo "NOTICE: /etc/ntp.conf was changed. Calculated diff:"
diff -Nu /etc/ntp.conf /etc/ntp.conf.bak
cp -f /etc/ntp.conf.bak /etc/ntp.conf
systemctl restart ntp
fi

