#!/bin/bash
#Install CLAM-AV
#AeonMike - Pinoylinux

OS=`cat /etc/os-release | awk {'print $1}'`
if [ "$OS" != "CentOS" ]
then
echo "System runs on Centos Linux";

echo ""
sleep 5s

clear


echo "Installing CLAM-AV Anti-virus"
echo ""
sleep 5s
 
yum -y install epel-release
yum repolist
yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd

#remove all example config

echo 'Removing CLAM-AV Sample Config'
sudo sed -i -e "s/^Example/#Example/" /etc/clamd.d/scan.conf
sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
sudo sed -i -e "s/#LocalSocket /LocalSocket /" /etc/clamd.d/scan.conf
freshclam


cat - >> /usr/lib/systemd/system/freshclam.service << "zEOF" 

[Unit]
Description = freshclam scanner
After = network.target

[Service]
Type = forking
ExecStart = /usr/bin/freshclam -d -c 1
Restart = on-failure
PrivateTmp =true

[Install]
WantedBy=multi-user.target
zEOF

echo 'Done'

cat - >> /etc/clamd.d/scan.conf  << "zEOF"

ScanOnAccess yes
OnAccessIncludePath /
OnAccessPrevention yes
OnAccessExtraScanning yes

zEOF

sudo systemctl enable clamd@scan
sudo systemctl enable freshclam
sudo systemctl start clamd@scan
sudo systemctl start freshclam

exit;

fi

apt-get install clamav clamav-daemon -y
systemctl enable clamav-freshclam
sudo freshclam
sudo mkdir /var/lib/clamav
sudo systemctl start clamav-freshclam

cat - >> /etc/clamav/clamd.conf << "zEOF"
ScanOnAccess true
OnAccessMountPath /
OnAccessPrevention false
OnAccessExtraScanning true
OnAccessExcludeUID 0

zEOF

exit;


