#!/bin/bash

devices=( "fgext.fam"
	  "fgacct.fam" 
	  "fgmkt.fam" 
	  "fgsales.fam"
	  "bo01.fam"
	  "bo02.fam"
	  "bo03.fam")

device='fgext.fam'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

device='fgacct.fam'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

device='fgmkt.fam'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

device='fgsales.fam'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

#device='bo01.fam'
#ssh admin@$device "
#exec restore config ftp demo_files/$device.conf 192.168.0.1
#y"

#device='bo02.fam'
#ssh admin@$device "
#exec restore config ftp demo_files/$device.conf 192.168.0.1
#y"

#device='bo03.fam'
#ssh admin@$device "
#exec restore config ftp demo_files/$device.conf 192.168.0.1
#y"
