#!/bin/bash


# Comment /root/wanem_init.sh last 2 lines

# ssh-copy-id from bastion to inet.fam
ssh-copy-id root@mpls.sdw

# fix /etc/network/interfaces
scp interfaces.mpls.sdw mpls.sdw:/etc/network/interfaces

# fix rc.local
scp rc.local.wanem mpls.sdw:/etc/rc.local

# reboot device 
ssh root@mpls.sdw "reboot"
