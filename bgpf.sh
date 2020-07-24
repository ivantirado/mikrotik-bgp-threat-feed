#!/bin/bash

/root/bgpf/create_list.sh

echo "List updated: $(date)" > /root/bgpf/lasttime.txt

/root/bgpf/updateconfig.sh

echo "Config updated: $(date)" >> /root/bgpf/lasttime.txt

