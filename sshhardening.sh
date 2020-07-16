#SSH-Hardening
#Aeonmike - Mike Cabalin
#PinoyLinux : Padawan Cyber Security Group

sed -i '/PermitRootLogin/s/^#//g'
sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config

sed -i '/X11Forwarding/s/^#//g'
sed -i '/^X11Forwarding/s/yes/no/' /etc/ssh/sshd_config


#Disable rhosts - While not common anymore, rhosts was a weak method to authenticate systems. 
#It defines a way to trust another system simply by its IP address


sed -i '/IgnoreRhosts/s/^#//g'
sed -i '/^IgnoreRhosts/s/no/yes/' /etc/ssh/sshd_config



#DNS hostname checking - By default, the SSH server can check if the client connecting maps back to the same 
#combination of hostname and IP address. 
#Use the option UseDNS to perform this basic check as an additional safeguard.

sed -i '/UseDNS/s/^#//g'
sed -i '/^UseDNS/s/no/yes/' /etc/ssh/sshd_config

#Disable empty passwords - Accounts should be protected and users should be accountable. 
#For this reason, the usage of empty passwords should not be allowed. 
#This can be disabled with the PermitEmptyPasswords option, which is the default.

sed -i '/PermitEmptyPasswords/s/^#//g'
sed -i '/^PermitEmptyPasswords/s/yes/no/' /etc/ssh/sshd_config


#Maximum authentication attempts - 
#To protect against brute-force attacks on the password of a user, limit the number of attempts

sed -i '/MaxAuthTries/s/^#//g'
sed -i '/^MaxAuthTries/s/6/2/' /etc/ssh/sshd_config


#Set SSH protocol
sed -i '/Protocol/s/^#//g'
sed -i '/^Protocol/s/6/2/' /etc/ssh/sshd_config



