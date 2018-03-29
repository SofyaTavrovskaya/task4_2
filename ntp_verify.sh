#!/bin/bash

systemctl status ntp
if[$? != 0];
then systemctl start ntp

diff /etc/ntp.conf /etc/ntp.conf.bak
if[$? != 0];
then cp /etc/ntp.conf.bak /etc/ntp.conf
systemctl restart ntp
