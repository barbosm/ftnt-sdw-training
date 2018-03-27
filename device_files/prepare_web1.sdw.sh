#!/bin/bash

devices=(  
	  "web1.sdw"
	  )


for device in "${devices[@]}"
do
        
	scp /root/ftnt-sdw-training/bastion_files/sources.list root@$device:/etc/apt/sources.list
	ssh -t root@$device "apt update"
	ssh -t root@$device "apt install php libapache2-mod-php php-mcrypt php-mysql vsftpd -y"
	scp /root/ftnt-sdw-training/device_files/10Mbps_testfile root@$device:/var/www/html/

done

