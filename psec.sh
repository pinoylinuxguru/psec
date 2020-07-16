#!/bin/bash
#written by Mike Cabalin
#AeonMike
#Pinoylinux : PadawanCyberSecurity

green='\e[0;32m'
RED='\033[0;31m'
NC='\033[0m'
DELAY=8

while true; do
  clear
  cat << _EOF_

  _____   _____ ______     
 |  __ \ / ____|  ____|    
 | |__) | (___ | |__   ___ 
 |  ___/ \___ \|  __| / __|
 | |     ____) | |___| (__ 
 |_|    |_____/|______\___|
  
 Pinoylinux : PadawanCyberSec  
 PSEc tool can be run on CENTOS/RHEL Ubuntu/Debian Distro

Please Select:

1. Centos/RHEL   - Harden Security
2. Ubuntu/Debian - Harden Security
3. Install Fail2Ban
4. Install ClamAV with On-Access Scan
5. Install Samba Anti-Ransomware
6. Install Lynis Auditor and schedule check
0. Quit

_EOF_

  read -p "Enter selection [0-6] > "

  if [[ $REPLY =~ ^[0-6]$ ]]; then
    case $REPLY in

      	1) 
      		echo 'Centos / RHEL'
        
		bash kernelhardening.sh  	
        	sleep $DELAY

		bash sshhardening.sh
        	sleep $DELAY
        
		bash systemhardening.sh
        	sleep $DELAY

		continue
	    	;;

	2) 

		echo 'Debian / Ubuntu'

                bash kernelhardening.sh
                sleep $DELAY

                bash sshhardening.sh
                sleep $DELAY

                bash systemhardening.sh
                sleep $DELAY

                continue
                ;;



	   3) 
		echo 'Fail2BAN'
        	bash fail2ban.sh
		sleep $DELAY
		continue
	    	;;


	    4) 
		echo 'ClamAV'
        	bash claminstall.sh
		sleep $DELAY
		continue
	    	;;


	    5) 
		echo 'Samba Anti-Ransomware'
        	bash samba.sh
		sleep $DELAY
		continue
	    	;;

	    6)
                echo 'Lynis Install'
                bash lynis.sh	
		sleep $DELAY

		bash set-lynis.sh
                sleep $DELAY
                continue
            	;;


    


      0)
        break
        ;;
    esac
  else
    echo "Invalid entry."
    sleep $DELAY
  fi
done
echo "Program terminated."



