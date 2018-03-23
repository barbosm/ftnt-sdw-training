#!/usr/bin/env python3

import sys
import os
import time 
import random

hostsubnet = ['10.10.41.']
serverip = '10.10.42.15'
devicecount = 16
#devicecount = int(input("The number of device to created:"))

 
#if devicecount > 1000:
#    devicecount = 1000

 
devicetypelist = ["Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; BOIE9;ENUS)", #win7 
                    "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:10.0.1) Gecko/20100101 Firefox/10.0.1.", #win7 64 bits 
                    "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:15.0) Gecko/20100101 Firefox/15.0.1", #Linux ubuntu
                    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.12) Gecko/20070719 CentOS/1.5.0.12-3.el5.centos Firefox/1.5.0.12", #Linux CentOS
                    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8", # MAC OS X
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 109) AppleWebKit/537.35.1 (KHTML, like Gecko) Version/6.1 Safari/537.35.1", #MAC OS X 10.9
                    "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; Xbox)XBMC/3.3-DEV-r31572 (Xbox; http://www.xbmc.org)", #Xbox
                    "Opera/9.30 (Nintendo Wii; U; ; 2071; Wii Shop Channel/1.0; en)", #Wii
                    "Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; Kindle Fire Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1", #kindle fire
                    "Mozilla/5.0 (BlackBerry; U; BlackBerry 9860; en-GB) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.296 Mobile Safari/534.11+", #blackBerry
                    "Mozilla/5.0 (Linux; Android 4.1.2; Nexus 7 Build/JZO54K) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166  Safari/535.19", #Nexus
                    "Mozilla/5.0 (Windows NT 6.3; ARM; Trident/7.0; Touch; rv:11.0) like Gecko", #surface 2
                    "Mozilla/5.0 (iPad; CPU iPhone OS 501 like Mac OS X) AppleWebKit/534.46 (KHTML like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3", #iPAD
                    "Mozilla/5.0 (iphone; U; CPU iPhone OS 435 like Mac OS X; zh-cn) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5", #iPhone
                    "Mozilla/5.0 (iPhone; CPU iPhone OS 80 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12A366 Safari/600.1.4", #iPhone 6 Plus
                    "Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53" #ipad
                   ]

 
macprefix = 'fd'
macprefix2 = '46'

 
for index in range(0, int(devicecount)):
    subnetindex = int(index/250)
    hostindex = index%250 + 2
    defaultgw = '10.10.41.254' 
    hostip = hostsubnet[subnetindex] + str(hostindex)
    print("[info] ==================" + str(index) + "=================== ")
#    print("[info]- set ip address to "+ hostip)
    cmd = '/sbin/ifconfig ens192 ' + hostip + ' netmask 255.255.255.0'
#    print(cmd)
    os.system(cmd)
    macaddress = '00:0c:'+ macprefix +':'+ macprefix2 +':' + hex(subnetindex)[2:]+ ":" + hex(hostindex)[2:]
#    print("[info]- set mac address to "+ macaddress)
    cmd = '/sbin/ifconfig ens192 hw ether ' + macaddress
#    print(cmd)
    os.system(cmd)
#    print("[Info]- Configure default gateway")
#    cmd = 'route del default'
#    print(cmd)
#    os.system(cmd)
    cmd = '/sbin/route add default gw ' + defaultgw + ' ens192'
#    print(cmd)
    os.system(cmd)
    time.sleep(5)
#    print("[info]- curl and ping")
    cmdcurl = '/usr/bin/curl -silent -A \"' + devicetypelist[ hostindex % len(devicetypelist)]  + '\" -output-document=/dev/null http://'+ serverip
    cmdping = '/bin/ping -c 2 '+ serverip
    print(devicetypelist[ hostindex % len(devicetypelist)])
    os.system(cmdcurl)
    time.sleep(5)
#    print(cmdping)
#    bash_command(cmdping)
    print("[info] ================== End =================== \n")
