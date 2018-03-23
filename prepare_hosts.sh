#!/bin/bash

devices=( "inet.fam"
	  "t1_acct.fam" 
	  "t1_bo01.fam" 
	  "t1_mkt.fam")

for device in "${devices[@]}"
do
	echo $device
	ssh-copy-id root@$device 

done

# fix hosts route table
