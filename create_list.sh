#!/bin/bash

cd /root/bgpf

wget -O drop.txt https://www.spamhaus.org/drop/drop.txt
wget -O edrop.txt https://www.spamhaus.org/drop/edrop.txt
wget -O dropv6.txt https://www.spamhaus.org/drop/dropv6.txt

cat /root/bgpf/drop.txt | grep -v '^;' | cut -d ';' -f 1 > /root/bgpf/concatipv4.txt
cat /root/bgpf/edrop.txt | grep -v '^;' | cut -d ';' -f1 >> /root/bgpf/concatipv4.txt
cat /root/bgpf/dropv6.txt | grep -v '^;' | cut -d ';' -f1 > /root/bgpf/concatipv6.txt
