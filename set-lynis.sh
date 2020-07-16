#!/bin/sh
#Be sure mailx is install -> rpm -qi mailx 
#if not installed run -> yum install mailx -y
#Aeonmike - PinoyLinux - PCG

read -p "Please enter email address for Lynis Report Sending: " userInput
echo ""
sleep 2s
# Check if string is empty using -z. For more 'help test'    
if [[ -z "$userInput" ]]; then
   printf '%s\n' "No input entered"
   exit 1
else
   # If userInput is not empty show what the user typed in and run ls -l
   printf "You entered %s " "$userInput"
   sed -i "s/user@mail.com/${userInput}/g" lynis-cron.sh 
   sleep 5s
   echo "Adding Cronjob of Lynis"
   sleep 5s
   echo "* 12 * * * sh /report/lynis-cron.sh" | tee -a /var/spool/cron/root
  exit; 
  fi


# The End
