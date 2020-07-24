systemctl stop bgpd

echo "! -*- bgp -*-
!
! BGPd sample configuratin file
!
! $Id: bgpd.conf.sample,v 1.1 2002/12/13 20:15:29 paul Exp $
!
hostname bgpd
password <PASSWORD>
enable password <PASSWORD>
!
!bgp multiple-instance
!
router bgp <ASN>
 bgp router-id <ROUTERID>
 neighbor <IP> remote-as <ASN>
 neighbor <IP> password <PASSWORD>
 neighbor <IP> ebgp-multihop
 neighbor <IP> next-hop-self" > /etc/quagga/bgpd.conf

for ip in $(cat /root/bgpf/concatipv4.txt);
do
  echo "network $ip" >> /etc/quagga/bgpd.conf
done

echo "address-family ipv6 unicast" >> /etc/quagga/bgpd.conf

echo "neighbor <IP> activate" >> /etc/quagga/bgpd.conf

for ip in $(cat /root/bgpf/concatipv6.txt);
do
  echo "  network $ip" >> /etc/quagga/bgpd.conf
done

echo "exit-address-family" >> /etc/quagga/bgpd.conf

echo "!
log file /var/log/quagga/bgpd.log
!
log stdout" >> /etc/quagga/bgpd.conf

systemctl start bgpd
