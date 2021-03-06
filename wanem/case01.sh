#!/bin/bash

device='inet.sdw'

printf '\n\n\n Configuring Internet WAN\n\n'
ssh root@$device "
# Cleanup
tc qdisc del dev eth4 root netem

# S01 INTERNET_A
tc qdisc add dev eth4 root netem delay 20ms

exit
" > /dev/null 2>&1

device='mpls.sdw'

printf '\n\n\n Configuring MPLS WAN\n\n'
ssh root@$device "
# Cleanup
tc qdisc del dev eth1 root netem

# DC01 MPLS
tc qdisc add dev eth1 root netem delay 10ms

exit
" > /dev/null 2>&1

