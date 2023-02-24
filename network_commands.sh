# nmap command to check ciphers
nmap --script ssh2-enum-algos -sV -p 22 1.2.3.4

# Add Persistent Static Route
vi /etc/sysconfig/network-scripts/route-eth0 --> Add lines --> 149.186.70.160/27 via 192.168.1.254 dev eth0

# Add Non-Persistent Static Route
route add -net 149.186.70.160 netmask 255.255.255.224 gw 192.168.1.254 dev eth0

# delete route
ip route del 149.186.70.160/27 via 192.168.1.254 dev eth0

# Check Open ports
netstat -tulnp
# t = tcp,u = udp,l = listening,n = numerical address, p = show PID of the program

# check if UDP port is open (-u parameter checks udp port)
nc -z -u -v 148.185.74.20 53 


# Check Open ports 
nmap hostname or IP 

# Check Ciphers ( SSL/TLS) 
nmap --script ssl-enum-ciphers hostname 

#Check Ciphers for App or a specific port 
nmap --script ssl-enum-ciphers -p port hostname 

# Check SSL Cert 
nmap --script ssl-cert -p port hostname 


