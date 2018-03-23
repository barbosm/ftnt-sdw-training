#!/bin/bash

# wanem host wanem_init.sh file
# must be modified for this script to work
# comment the last two lines of that file
# to prevent wanem.sh to start after user login

device='inet.sdw'

printf '\n\n\n Configuring Internet WAN\n\n'
ssh root@$device "
# Cleanup
tc qdisc del dev eth1 root netem
tc qdisc del dev eth2 root netem
tc qdisc del dev eth3 root netem
tc qdisc del dev eth4 root netem
tc qdisc del dev eth5 root netem
tc qdisc del dev eth6 root netem
tc qdisc del dev eth7 root netem
tc qdisc del dev eth8 root netem
tc qdisc del dev eth9 root netem

exit
" > /dev/null 2>&1


device='mpls.sdw'
printf '\n\n\n Configuring MPLS WAN\n\n'
ssh root@$device "
# Cleanuo
tc qdisc del dev eth1 root netem
tc qdisc del dev eth2 root netem
tc qdisc del dev eth3 root netem
tc qdisc del dev eth4 root netem
tc qdisc del dev eth5 root netem
tc qdisc del dev eth6 root netem
tc qdisc del dev eth7 root netem
tc qdisc del dev eth8 root netem
tc qdisc del dev eth9 root netem

exit
" > /dev/null 2>&1

