#!/bin/bash
apt install vsftpd -y
if [ $? -eq 0 ];then
	echo "ftp install success!"
else
	echo "apt install fail,please check apt源"
	exit
fi

tee -a /etc/vsftpd.conf <<< "userlist_deny=NO"
tee -a /etc/vsftpd.conf <<< "userlist_enable=YES"
tee -a /etc/vsftpd.conf <<< "userlist_file=/etc/allowed_users"
tee -a /etc/vsftpd.conf <<< "local_enable=YES"
tee -a /etc/vsftpd.conf <<< "write_enable=YES"
tee -a /etc/vsftpd.conf <<< "pasv_promiscuous=YES"
tee -a /etc/vsftpd.conf <<< "listen=YES"
tee -a /etc/vsftpd.conf <<< "listen_ipv6=No"

/etc/init.d/vsftpd start

if [ $? -eq 0 ];then
	echo "ftp 启动成功"
else
	echo "ftp 启动失败，请检查配置文件"
	exit
fi

useradd -m ftp-user1
echo ftp-user1:123456 | chpasswd
touch /home/ftp-user1/fpt.txt
touch  /etc/allowed_users
tee -a /etc/allowed_users <<< "ftp-user1"

echo "安装完成，请使用客户端登入ftp"