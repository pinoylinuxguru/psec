#!/bin/bash
#Aeonmike - PinoyLinux : PadawanCyberSecurity

OS=`cat /etc/os-release | awk {'print $1}'`
if [ "$OS" != "CentOS" ]
then
echo "System runs on Centos Linux";

echo ""
sleep 5s

clear

echo 'Installing Lynis Audit'

mkdir /report
chmod -R 775 /report

yum install -y lynis 

sleep 5s

echo "Running Lynis Auditor, report will be save to /report/"

lynis audit system
sleep 5s

echo 'Press enter to check Lynis - Report'


sleep 10s

grep -E "^warning|^suggestion" /var/log/lynis-report.dat >> /report/lynis-report.log
echo "Report saved! ->  /report/lynis-report.log"

echo ""
sleep 10s

fi

echo "Installing Lynis for Debian/Ubuntu"

sudo apt install apt-transport-https
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C80E383C3DE9F082E01391A0366C67DE91CA5D5F
sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -

apt-get update -y


sleep 5s

apt install lynis -y

sleep 5s

echo "Running Lynis Auditor, report will be save to /report/"

lynis audit system
sleep 5s

echo 'Press enter to check Lynis - Report'
echo ""


sleep 10s

grep -E "^warning|^suggestion" /var/log/lynis-report.dat >> /report/lynis-report.log

echo "Report saved! ->  /report/lynis-report.log"
