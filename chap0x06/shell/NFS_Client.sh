#!/bin/bash
apt-get install nfs-common  -y
if [ $? -eq 0 ];then
	echo "nft-common install success!"
else
	echo "apt install fail,please check apt源"
	exit
fi

mount -t nfs 192.168.0.103:/nfs /mnt -o nolock

if [ $? -eq 0 ];then
	echo "目录挂载成功!"
else
	echo "目录挂载失败"
	exit
fi