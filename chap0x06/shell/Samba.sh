#!/bin/bash
apt-get install  samba -y
if [ $? -eq 0 ];then
	echo "sambainstall success!"
else
	echo "apt install fail,please check apt源"
	exit
fi

cp /etc/samba/smb.conf  /etc/samba/smb.conf.bak

touch /etc/samba/smb.conf

tee -a /etc/samba/smb.conf <<< "[ work ]"

tee -a /etc/samba/smb.conf <<< "comment = samba home directory "

tee -a /etc/samba/smb.conf <<< " path = /home/ftp-user1/"

tee -a /etc/samba/smb.conf <<< " public = yes "

tee -a /etc/samba/smb.conf <<< "browseable = yes "

tee -a /etc/samba/smb.conf <<< "writeable = yes "

tee -a /etc/samba/smb.conf <<< " read only = no "

tee -a /etc/samba/smb.conf <<< "valid users = lsh "

tee -a /etc/samba/smb.conf <<< "create mask = 0755 "

tee -a /etc/samba/smb.conf <<< " directory mask = 0755"

tee -a /etc/samba/smb.conf <<< " available = yes "

/etc/init.d/smbd start

if [ $? -eq 0 ];then
	echo "dhcp 启动成功"
else
	echo "dhcp启动失败，请检查配置文件"
	exit
fi