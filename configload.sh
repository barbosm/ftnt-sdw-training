#!/bin/bash

device='dc01.sdw'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

device='dc02.sdw'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

device='s01.sdw'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"

device='s02.sdw'
ssh admin@$device "
exec restore config ftp demo_files/$device.conf 192.168.0.1
y"
