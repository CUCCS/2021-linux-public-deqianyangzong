#!/bin/bash
apt-get install nfs-kernel-server -y
if [ $? -eq 0 ];then
	echo "nft-server install success!"
else
	echo "apt install fail,please check apt源"
	exit
fi
/bin/bash -c 'echo "/nfs *(rw,sync,no_root_squash)" >> /etc/exports'
mkdir /nfs
chmod -R 755 /nfs
chown -R sukie:sukie /nfs/
chmod o+x /nfs
/etc/init.d/nfs-kernel-server start

if [ $? -eq 0 ];then
	echo "ftp 启动成功"
else
	echo "ftp 启动失败，请检查配置文件"
	exit
fi
echo "test" >> /nfs/test.txt