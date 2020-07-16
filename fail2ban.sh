#!/bin/bash
#Install CLAM-AV
#AeonMike - Pinoylinux : PadawanCyberSecurity

if [ "$OS" != "CentOS" ]
then
echo "System runs on Centos Linux";

echo ""
sleep 5s

clear


echo "Installing Fail2Ban for Centos"
echo ""
sleep 5s

yum install fail2ban mailx -y

systemctl enable fail2ban

sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local


#cat - >>  /etc/fail2ban/jail.local << "zEOF"
#
#[samba]
#filter=samba
#enabled=true
#action=iptables-multiport[name=samba,port="135,139,445,137,138",protocol=tcp]
#       mail[name=samba-ransomware,dest=mike.cabalin@gmail.com]
#logpath=/var/log/messages
#maxretry=1
# Check the last 10 minutes
#findtime=600
# Ban for 30 days
#bantime=2592000
#zEOF


#echo 
#touch /etc/fail2ban/filter.d/samba.conf

#cat - >> /etc/fail2ban/filter.d/samba.conf << "zEOF
#
#[INCLUDES]
#before = common.conf
#
#[Definition]
#
#__known_ransom_extensions_re=(\.k$|\.encoderpass$|\.key$|\.ecc$|\.ezz$|\.exx$|\.zzz$|\.xyz$|\.aaa$|\.abc$|\.ccc$|\.vvv$|\.xxx$|\.ttt$|\.micro$|\.encrypted$|\.locked$|\.crypto$|_crypt$|\.crinf$|\.r5a$|\.xrtn$|\.XTBL$|\.crypt$|\.R16M01D05$|\.pzdc$|\.good$|\.LOL\!$|\.OMG\!$|\.RDM$|\.RRK$|\.encryptedRSA$|\.crjoker$|\.EnCiPhErEd$|\.LeChiffre$|\.keybtc@inbox_com$|\.0x0$|\.bleep$|\.1999$|\.vault$|\.HA3$|\.toxcrypt$|\.magic$|\.SUPERCRYPT$|\.CTBL$|\.CTB2$|\.locky$|\.wnry$|\.wcry$|\.wncry$|\.wncryt$|\.uiwix$)
## Known ransomware files regex
#__known_ransom_files_re=(HELPDECRYPT\.TXT$|HELP_YOUR_FILES\.TXT$|HELP_TO_DECRYPT_YOUR_FILES\.txt$|RECOVERY_KEY\.txt$|HELP_RESTORE_FILES\.txt$|HELP_RECOVER_FILES\.txt$|HELP_TO_SAVE_FILES\.txt$|DecryptAllFiles\.txt$|DECRYPT_INSTRUCTIONS\.TXT$|INSTRUCCIONES_DESCIFRADO\.TXT$|How_To_Recover_Files\.txt$|YOUR_FILES\.HTML$|YOUR_FILES\.url$|Help_Decrypt\.txt$|DECRYPT_INSTRUCTION\.TXT$|HOW_TO_DECRYPT_FILES\.TXT$|ReadDecryptFilesHere\.txt$|Coin\.Locker\.txt$|_secret_code\.txt$|About_Files\.txt$|Read\.txt$|ReadMe\.txt$|DECRYPT_ReadMe\.TXT$|DecryptAllFiles\.txt$|FILESAREGONE\.TXT$|IAMREADYTOPAY\.TXT$|HELLOTHERE\.TXT$|READTHISNOW\!\!\!\.TXT$|SECRETIDHERE\.KEY$|IHAVEYOURSECRET\.KEY$|SECRET\.KEY$|HELPDECYPRT_YOUR_FILES\.HTML$|help_decrypt_your_files\.html$|HELP_TO_SAVE_FILES\.txt$|RECOVERY_FILES\.txt$|RECOVERY_FILE\.TXT$|RECOVERY_FILE.*\.txt$|HowtoRESTORE_FILES\.txt$|HowtoRestore_FILES\.txt$|howto_recover_file\.txt$|restorefiles\.txt$|howrecover\+.*\.txt$|_how_recover\.txt$|recoveryfile.*\.txt$|recoverfile.*\.txt$|recoveryfile.*\.txt$|Howto_Restore_FILES\.TXT$|help_recover_instructions\+.*\.txt$|_Locky_recover_instructions\.txt$)
#
#_daemon = smbd
#
#
#failregex = ^%(__prefix_line)s.*[aA]uthentication for user .* from <HOST> .* FAILED\s.*$
#            ^%(__prefix_line)s.*Failed [-/\w]+ for .* from <HOST>\s.*$
#            ^%(__prefix_line)s.*ROOT LOGIN REFUSED .* FROM <HOST>\s.*$
#            ^%(__prefix_line)s.*[iI](?:llegal|nvalid) user .* from <HOST>\s.*$
#			smbd.*:\ IP=<HOST>\ .*%(__known_ransom_extensions_re)s
#			smbd.*:\ IP=<HOST>\ .*%(__known_ransom_files_re)s
#			
#zEOF



systemctl start fail2ban

exit;

fi
apt-get install -y fail2ban

cat - >> /etc/fail2ban/jail.local << "zEOF"

[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 3

zEOF

sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
