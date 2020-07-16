#!/bin/bash
#Aeonmike - PinoyLinux : PadawanCyberSecurity


OS=`cat /etc/os-release | awk {'print $1}'`
if [ "$OS" != "CentOS" ]
then
echo "System runs on Centos Linux";

echo ""
sleep 5s

clear

echo 'Installing Samba Server for Centos'

sleep 5s


yum install samba samba-client iptables-services -y

sudo systemctl enable smb.service
sudo systemctl enable nmb.service
sudo systemctl enable iptables


sudo systemctl start smb.service
sudo systemctl start nmb.service
sudo systemctl start iptables


sudo iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 139 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 445 -j ACCEPT

cp smb.conf /etc/samba/

exit;
fi

apt-get install samba iptables-persistent -y

ufw disable

sudo iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 139 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 445 -j ACCEPT

sudo iptables -S

cp smb.conf /etc/samba/

exit;


