#!/bin/bash
#Aeonmike - PinoyLinux : Padawan CyberSecurity Group
#


echo "Linux Kernel /etc/sysctl.conf Hardening"

echo ""

sleep 5s

# Controls IP packet forwarding
sysctl -w net.ipv4.ip_forward = 0

# Do not accept source routing
sysctl -w net.ipv4.conf.default.accept_source_route = 0

# Controls the use of TCP syncookies
# Turn on SYN-flood protections
sysctl -w net.ipv4.tcp_syncookies = 1
sysctl -w net.ipv4.tcp_synack_retries = 5

########## IPv4 networking start ##############
# Send redirects, if router, but this is just server
# So no routing allowed 
sysctl -w net.ipv4.conf.all.send_redirects = 0
sysctl -w net.ipv4.conf.default.send_redirects = 0

# Turn on execshield
sysctl -w kernel.exec-shield=1
sysctl -w kernel.randomize_va_space=1

# Enable IP spoofing protection
sysctl -w net.ipv4.conf.all.rp_filter=1

# Disable IP source routing
sysctl -w net.ipv4.conf.all.accept_source_route=0

# Ignoring broadcasts request
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sysctl -w net.ipv4.icmp_ignore_bogus_error_messages=1



 
# Accept Redirects? No, this is not router
sysctl -w  net.ipv4.conf.all.accept_redirects = 0
sysctl -w  net.ipv4.conf.all.secure_redirects = 0
 
# Log packets with impossible addresses to kernel log? yes
sysctl -w net.ipv4.conf.all.log_martians = 1
sysctl -w net.ipv4.conf.default.accept_source_route = 0
sysctl -w net.ipv4.conf.default.accept_redirects = 0
sysctl -w net.ipv4.conf.default.secure_redirects = 0
 
# Ignore all ICMP ECHO and TIMESTAMP requests sent to it via broadcast/multicast
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts = 1
 
# Prevent against the common 'syn flood attack'
sysctl -w net.ipv4.tcp_syncookies = 1
 
 
# Controls source route verification
sysctl -w  net.ipv4.conf.default.rp_filter = 1 
 
########## IPv6 networking start ##############
# Number of Router Solicitations to send until assuming no routers are present.
# This is host and not router
sysctl -w net.ipv6.conf.default.router_solicitations = 0
 
# Accept Router Preference in RA?
sysctl -w net.ipv6.conf.default.accept_ra_rtr_pref = 0
 
# Learn Prefix Information in Router Advertisement
sysctl -w net.ipv6.conf.default.accept_ra_pinfo = 0
 
# Setting controls whether the system will accept Hop Limit settings from a router advertisement
sysctl -w net.ipv6.conf.default.accept_ra_defrtr = 0
 
#router advertisements can cause the system to assign a global unicast address to an interface
sysctl -w net.ipv6.conf.default.autoconf = 0
 
#how many neighbor solicitations to send out per address?
sysctl -w net.ipv6.conf.default.dad_transmits = 0
 
# How many global unicast IPv6 addresses can be assigned to each interface?
sysctl -w net.ipv6.conf.default.max_addresses = 1
 
# increase system file descriptor limit    
sysctl -w fs.file-max = 65535
 
#Allow for more PIDs 
sysctl -w kernel.pid_max = 65536
 
#Increase system IP port limits
sysctl -w net.ipv4.ip_local_port_range = 2000 65000
 
# RFC 1337 fix
sysctl -w net.ipv4.tcp_rfc1337=1

#Protects against creating or following links under certain conditions
#

sysctl -w fs.protected_hardlinks=1
sysctl -w fs.protected_symlinks=1

echo "Saving changes"
echo ""

sysctl -p
