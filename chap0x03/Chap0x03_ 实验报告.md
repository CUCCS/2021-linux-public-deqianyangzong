# Chap0x03  Systemd 入门

## 软件环境

- ubuntu-20.04.2-live-server-amd64.iso
- VirtualBox 6.1.18
- asciinema
- macOS Big Sur 11.2.2

## 实验要求 
1. 确保本地已经完成asciinema auth，并在asciinema成功关联了本地账号和在线账号
2. 上传本人亲自动手完成的systemed操作全程录像
3. 在自己的github仓库上新建markdown格式纯文本文件附上asciinema的分享URL
4. 完成第三章自查清单
5. **避免在终端操作录像过程中暴漏密码、个人隐私等任何机密数据**

## Systemd 学习过程

### 前期准备

- 打开`asciinema`官网，验证邮箱

  [asciinema官网](https://asciinema.org/docs)

- 进入本地账号

### Systemd 学习过程录像

#### **Systemd 入门教程：命令篇**

##### Chap1_由来

##### Chap2_Systemd 概述

##### Chap3_系统管理

- Systemd : 系统管理_ 3.1 systemctl

- Systemd : 系统管理_ 3.2 systemd-analyze

- Systemd : 系统管理_ 3.3 hostnamectl

 [![Systemd : 系统管理_ 3.3 hostnamectl](https://asciinema.org/a/C4KrIhB6ZfcbgcbKi7Wo6Qq4d.svg)](https://asciinema.org/a/C4KrIhB6ZfcbgcbKi7Wo6Qq4d)

- Systemd : 系统管理_ 3.4 localectl

 [![Systemd : 系统管理_ 3.4 localectl](https://asciinema.org/a/pl2SGF5QBzp4BsJz4YUBTPXSH.svg)](https://asciinema.org/a/pl2SGF5QBzp4BsJz4YUBTPXSH)

- Systemd : 系统管理_3.5 timedatectl

 [![Systemd : 系统管理_3.5 timedatectl](https://asciinema.org/a/sqVdn1jMkPQwimKsFtmEr5iG2.svg)](https://asciinema.org/a/sqVdn1jMkPQwimKsFtmEr5iG2)

- Systemd : 系统管理_3.6 loginctl

 [![Systemd : 系统管理_3.6 loginctl](https://asciinema.org/a/iZ8iLqepOZYgtPQsoOC42KvTr.svg)](https://asciinema.org/a/iZ8iLqepOZYgtPQsoOC42KvTr)


##### Chap4_Unit

- Systemd : Unit_ 4.1 含义

 [![Systemd : Unit_ 4.1 含义](https://asciinema.org/a/aQjnMkPwjspk1gpRTNnpr7dyo.svg)](https://asciinema.org/a/aQjnMkPwjspk1gpRTNnpr7dyo)

- Systemd : Unit_ 4.2 Unit 的状态

 [![Systemd : Unit_ 4.2 Unit 的状态](https://asciinema.org/a/HEQM19E2RyyXdv9xs7FxuD9Xt.svg)](https://asciinema.org/a/HEQM19E2RyyXdv9xs7FxuD9Xt)

- Systemd : Unit_ 4.3 Unit 管理

 [![Systemd : Unit_ 4.3 Unit 管理](https://asciinema.org/a/q4IJwA1WJuMg1Z9btYYE0Osg2.svg)](https://asciinema.org/a/q4IJwA1WJuMg1Z9btYYE0Osg2)

- Systemd : Unit_ 4.4 依赖关系

 [![Systemd : Unit_ 4.4 依赖关系](https://asciinema.org/a/SFwCoNoYJGJ6GyzJMMWItuMyo.svg)](https://asciinema.org/a/SFwCoNoYJGJ6GyzJMMWItuMyo)


##### Chap5_Unit 的配置文件

- Systemd : Unit 的配置文件_ 5.1 概述

 [![Systemd : Unit 的配置文件_ 5.1 概述](https://asciinema.org/a/yyeSdFL2MHOG9dCT2QsOwF4xH.svg)](https://asciinema.org/a/yyeSdFL2MHOG9dCT2QsOwF4xH)

- Systemd : Unit 的配置文件_ 5.2 配置文件的状态

 [![Systemd : Unit 的配置文件_ 5.2 配置文件的状态](https://asciinema.org/a/Mjiciz0evluA2cS2wK2uW8WBb.svg)](https://asciinema.org/a/Mjiciz0evluA2cS2wK2uW8WBb)

- Systemd : Unit 的配置文件_ 5.3 配置文件的格式

 [![Systemd : Unit 的配置文件_ 5.3 配置文件的格式](https://asciinema.org/a/ONwDYcHut0TqLkJRVHHJuALZ3.svg)](https://asciinema.org/a/ONwDYcHut0TqLkJRVHHJuALZ3)

- Systemd : Unit 的配置文件_ 5.4 配置文件的区块

 [![Systemd : Unit 的配置文件_ 5.4 配置文件的区块](https://asciinema.org/a/l3j9gb8zaptRUwkwat31BrE3P.svg)](https://asciinema.org/a/l3j9gb8zaptRUwkwat31BrE3P)


##### Chap6_Target

- Systemd : Target

 [![Systemd : Unit_ 4.1 含义](https://asciinema.org/a/aQjnMkPwjspk1gpRTNnpr7dyo.svg)](https://asciinema.org/a/aQjnMkPwjspk1gpRTNnpr7dyo)


##### Chap7_日志管理

- Systemd : 日志管理

 [![Systemd : 日志管理](https://asciinema.org/a/eC9TPjYInHl91O8nFL4AOEejL.svg)](https://asciinema.org/a/eC9TPjYInHl91O8nFL4AOEejL)


#### **Systemd 入门教程：实战篇**

##### Chap1～6

- Systemd ：实战篇_Chap1～6
- [ ] Chap1开机启动
- [ ] Chap2_启动服务
- [ ] Chap3_停止服务
- [ ] Chap4_读懂配置文件
- [ ] Chap5_[Unit] 区块：启动顺序与依赖关系
- [ ] Chap6_[Service] 区块：启动行为

 [![Systemd ：实战篇_Chap1～6](https://asciinema.org/a/sudBb2T7tZxnGNwqMLclTDCXk.svg)](https://asciinema.org/a/sudBb2T7tZxnGNwqMLclTDCXk)

##### Chap7～9

- Systemd ：实战篇_Chap7～9
- [ ] Chap7_[Install] 区块
- [ ] Chap8_Target 的配置文件
- [ ] Chap9_修改配置文件后重启

 [![Systemd ：实战篇_Chap7～9](https://asciinema.org/a/7sxfmauHdecKPEwmqZrJpNxZI.svg)](https://asciinema.org/a/7sxfmauHdecKPEwmqZrJpNxZI)


## Systemd自查清单

1. 如何添加一个用户并使其具备`sudo`执行程序的权限？
   > **`adduser <username>`
     `usermod -G sudo -a <username>`**

2. 如何将一个用户添加到一个用户组？
   > **`usermod -a -G <groupname> <username>`**

3. 如何查看当前系统的分区表和文件系统详细信息？
   > **`df -h` 
    `gdisk -l`
    `fdisk -l`
    `parted -l`
    `lsblk -f`**

4. 如何实现开机自动挂载`Virtualbox`的共享目录分区？
   > **在主机和虚拟机中分别创建共享文件夹，
       在虚拟机中挂载命令
      `` sudo mount -t vboxsf <dirname> /mnt/dirname ``
       最后将共享文件夹添加进`/etc/fstab`目录**

5. 基于`LVM`（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
   > **动态扩容:`lvextand -L +<size> <dirname>`
    缩减容量:`lvreduce -L -<size> <dirname>`**

6. 如何通过`systemd`设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
   > **`ExecStartPost=<指定脚本位置> post1`
     `ExecStopPost=<指定脚本位置> post2`
     `sudo systemctl daemon-reload`
     `sudo systemctl restart httpd.service`**

7. 如何通过`systemd`设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死
   > **`Restart=always`
   `sudo systemctl daemon-reload`**


## 遇到的问题及解决方案

- 操作3.1-3.2时，系统休眠，无法进行`asciinema`的录制

- 设置时区前，需先执行命令，再进行设置
`timedatectl set-ntp no`


## 参考文献

- [Systemd 入门教程：命令篇](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)
- [Systemd 入门教程：实战篇](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)



