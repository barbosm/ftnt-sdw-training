#!/bin/bash

# copy /etc/apt/sources.list 

# run
# apt install dnsmasq vsftpd git
# apt install php libapache2-mod-php php-mcrypt php-mysql

# git clone https://github.com/barbosm/ftnt-sdw-training.git

# FTP
cp ftpusers /etc/ftpusers
cp vsftpd.conf /etc/vsftpd.conf
service vsftpd restart
mkdir -p /srv/ftp/demo_files
mount --bind /root/ftnt-sdw-training/ftp_files /srv/ftp/demo_files

# SSH
mkdir /root/.ssh
cp ssh_config /root/.ssh/config
cp authorized_keys /root/.ssh/authorized_keys

cp id_rsa.key_bastion /root/.ssh/id_rsa
cp id_rsa.pub_bastion /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa

#SSHD
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.ori
cp sshd_config /etc/ssh/sshd_config
service ssh restart

# DNS
cp hosts /etc/hosts
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.ori
cp dnsmasq.conf /etc/dnsmasq.conf
service dnsmasq restart
