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
        
	scp root@$device:/etc/network/interfaces /root/ftnt-sdw-training/device_files/interfaces.$device 
	
done


# fix hosts route table

