#!/bin/sh


cat << _EOF_

  _____   _____ ______     
 |  __ \ / ____|  ____|    
 | |__) | (___ | |__   ___ 
 |  ___/ \___ \|  __| / __|
 | |     ____) | |___| (__ 
 |_|    |_____/|______\___|
 
 Pinoylinux : Padawan Cybersecurity group
 Ver: AeonMike                            

_EOF_                           


INSTALL_DIR="/var/opt/psec"
REPORT_DIR="/report"

OS=`cat /etc/os-release | awk {'print $1}'`
if [ "$OS" != "CentOS" ]
then
echo "System runs on Centos Linux";

echo ""
sleep 5s

clear


echo "Updating System"
yum update -y
yum install -y git wget perl

echo "[✔] Checking directories..."; 
if [ -d "$INSTALL_DIR" ]; then
    echo "[◉] PSEC directory was found, Installed successfully!"
fi
   echo "[◉] PSEC directory was not found! Check logs"

clear
sleep 5s

fi

apt update -y
apt install git perl wget -y

mkdir -p $REPORT_DIR INSTALL_DIR
chmod -R 660 INSTALL_DIR
chmod -R 660 REPORT_DIR

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[◉] PSEC directory was found, Installed successfully!"
fi
   echo "[◉] PSEC directory was not found! Check logs"

clear
sleep 5s

