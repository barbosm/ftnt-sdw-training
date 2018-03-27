#!/bin/bash

devices=(  
	  "t1_dc01.sdw"
	  )


for device in "${devices[@]}"
do
        
	scp /root/ftnt-sdw-training/device_files/hosts.t1_dc01.sdw root@$device:/etc/hosts
	ssh -t root@$device '(crontab -l 2>/dev/null; echo "*/5 * * * * /root/gen_devtypes_realtime.t1_dc01.sdw.py") | crontab -'	
	ssh -t root@$device "chmod +x /root/gen_devtypes_realtime.t1_dc01.sdw.py"
done


# fix hosts route table

