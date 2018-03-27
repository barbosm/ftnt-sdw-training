#!/bin/bash


# Comment /root/wanem_init.sh last 2 lines

# ssh-copy-id from bastion to inet.fam
ssh-copy-id root@inet.sdw

# fix /etc/network/interfaces
scp interfaces.inet.sdw inet.sdw:/etc/network/interfaces

# fix rc.local
scp rc.local.wanem inet.sdw:/etc/rc.local

# reboot inet.sdw
ssh inet.sdw "reboot"

