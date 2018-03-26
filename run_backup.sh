#!/bin/bash

devices=( "dc01.sdw"
          "dc02.sdw"
          "s01.sdw"
          "s02.sdw")

for device in "${devices[@]}"
do
	echo $device
	ssh admin@$device "
	exec backup config ftp /srv/ftp/demo_files/$device.conf 192.168.0.1 root fortinet
	"

done

chmod -R +r *
