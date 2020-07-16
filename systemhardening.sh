#!/bin/sh



#Now disable USB mass storage, if you're not using it in your environment

echo "Disabling USB Mass Storage"
echo "blacklist usb-storage" > /etc/modprobe.d/blacklist-usbstorage

echo "Disable root access"

echo "tty1" > /etc/securetty
chmod 700 /root

echo "Passwords expire every 180 days"
perl -npe 's/PASS_MAX_DAYS\s+99999/PASS_MAX_DAYS 180/' -i /etc/login.defs

echo ""

echo "Passwords may only be changed once a day"
perl -npe 's/PASS_MIN_DAYS\s+0/PASS_MIN_DAYS 1/g' -i /etc/login.defs

echo "updating your system to use sha512 instead of md5 for password protection"
authconfig --passalgo=sha512 --update

