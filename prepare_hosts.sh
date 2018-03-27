#!/bin/bash

devices=( "t1_dc01.sdw" 
	  "t1_dc02.sdw" 
	  "t1_s01.sdw"
	  "t1_s02.sdw"
	  "t2_dc01.sdw"
	  "t2_s01.sdw"
	  "iperf.sdw"
	  "web1.sdw"
	  )

password="fortinet"

for device in "${devices[@]}"
do
        
	echo $device
	ssh-copy-id fortinet@$device
	scp /root/ftnt-sdw-training/bastion_files/id_rsa.pub_bastion fortinet@$device:/home/fortinet/
	scp /root/ftnt-sdw-training/bastion_files/id_rsa.key_bastion fortinet@$device:/home/fortinet/       
	echo "$password" | ssh -t fortinet@$device "sudo -S mkdir /root/.ssh"
	echo "$password" | ssh -t fortinet@$device "sudo -S cp id_rsa.pub_bastion /root/.ssh/authorized_keys"
	echo "$password" | ssh -t fortinet@$device "sudo -S mv id_rsa.pub_bastion /root/.ssh/id_rsa.pub"
	echo "$password" | ssh -t fortinet@$device "sudo -S mv id_rsa.key_bastion /root/.ssh/id_rsa"
	echo "$password" | ssh -t fortinet@$device "sudo -S chown -R root:root /root/.ssh/"

done


# fix hosts route table

