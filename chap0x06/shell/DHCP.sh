#!/bin/bash
apt-get install  isc-dhcp-server -y
if [ $? -eq 0 ];then
	echo "dhcp install success!"
else
	echo "apt install fail,please check apt源"
	exit
fi

tee -a /etc/dhcp/dhcpd.conf <<< “subnet 10.0.0.0 netmask 255.255.255.0 {”
tee -a /etc/dhcp/dhcpd.conf <<< “range 10.0.0.10 10.0.0.100;”
tee -a /etc/dhcp/dhcpd.conf <<< “option domain-name-servers 202.206.192.33, 223.5.5.5;”
tee -a /etc/dhcp/dhcpd.conf <<< “option domain-name "mylab.com";”
tee -a /etc/dhcp/dhcpd.conf <<< “option subnet-mask 255.255.255.0;”
tee -a /etc/dhcp/dhcpd.conf <<< “option routers 10.0.0.1;”
tee -a /etc/dhcp/dhcpd.conf <<< “option broadcast-address 10.0.0.255;”
tee -a /etc/dhcp/dhcpd.conf<<< “default-lease-time 600;”
tee -a /etc/dhcp/dhcpd.conf <<< “max-lease-time 7200;”
tee -a /etc/dhcp/dhcpd.conf <<< }

/etc/init.d/isc-dhcp-server start

if [ $? -eq 0 ];then
	echo "dhcp 启动成功"
else
	echo "dhcp启动失败，请检查配置文件"
	exit
fi