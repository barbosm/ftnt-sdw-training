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

for device in "${devices[@]}"
do
	echo $device
	ssh-copy-id fortinet@$device 

done

# fix hosts route table
