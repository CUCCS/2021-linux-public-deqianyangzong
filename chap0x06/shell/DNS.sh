#!/bin/bash
apt-get install  bind9 -y
if [ $? -eq 0 ];then
	echo "bind9 install success!"
else
	echo "apt install fail,please check apt源"
	exit
fi
tee -a /etc/bind/named.conf.local <<< "zone "mag.com"{"

tee -a /etc/bind/named.conf.local <<< "type master;"

tee -a /etc/bind/named.conf.local <<< "file "db.mag.com";"

tee -a /etc/bind/named.conf.local <<< "};"

tee -a /etc/bind/named.conf.local <<< "zone "git.com"{"

tee -a /etc/bind/named.conf.local <<< "type master;"

tee -a /etc/bind/named.conf.local <<< "file "db.git.com";"

tee -a /etc/bind/named.conf.local <<< "};"

cp /etc/bind/db.local /var/cache/bind/db.mag.com cp /etc/bind/db.local /var/cache/bind/db.git.com

tee -a /var/cache/bind/db.git.com <<< "@ IN A 192.168.0.103"

sed -i 's/0.0.0.0/8.8.8.8/g' /etc/bind/named.conf.options

 /etc/init.d/bind9 restart

if [ $? -eq 0 ];then
	echo "dns启动成功"
else
	echo "dns启动失败，请检查配置文件"
	exit
fi