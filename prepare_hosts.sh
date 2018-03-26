#!/bin/bash

devices=( "t1_dc01.sdw" 
	  "t1_dc02.sdw" 
	  "t1_s01.sdw")

for device in "${devices[@]}"
do
	echo $device
	ssh-copy-id fortinet@$device 

done

# fix hosts route table
