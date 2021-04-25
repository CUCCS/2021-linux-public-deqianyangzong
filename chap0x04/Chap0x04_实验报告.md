# Chap0x04  Shell脚本编程

## 软件环境

- ubuntu-20.04.2-live-server-amd64.iso
- VirtualBox 6.1.18
- macOS Big Sur 11.2.2

## 实验要求

- 继承第一章：Linux基础（实验）的所有实验报告要求
- 上述任务的所有源代码文件必须单独提交并提供详细的–help脚本内置帮助信息
- 任务二的所有统计数据结果要求写入独立实验报告

## 实验任务

### 任务一：用bash编写一个图片批处理脚本，实现以下功能：
- ☑️支持命令行参数方式使用不同功能
- ☑️支持对指定目录下所有支持格式的图片文件进行批处理指定目录进行批处理
- ☑️支持以下常见图片批处理功能的单独使用或组合使用
    - ☑️支持对jpeg格式图片进行图片质量压缩
    - ☑️支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
    - ☑️支持对图片批量添加自定义文本水印
    - ☑️支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
    - ☑️支持将png/svg图片统一转换为jpg格式


### 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
- ☑️统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
- ☑️统计不同场上位置的球员数量、百分比
- ☑️名字最长的球员是谁？名字最短的球员是谁？
- ☑️年龄最大的球员是谁？年龄最小的球员是谁？


### 任务三：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
- ☑️统计访问来源主机TOP 100和分别对应出现的总次数
- ☑️统计访问来源主机TOP 100 IP和分别对应出现的总次数
- ☑️统计最频繁被访问的URL TOP 100
- 统计不同响应状态码的出现次数和对应百分比
- 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
- 给定URL输出TOP 100访问来源主机

## 实验步骤

### 任务一

1. 安装`imagemagick`和`shellcheck`

    ```
    sudo apt-get update && sudo apt-get install -y shellcheck
    sudo apt-get install -y imagemagick
    ```

2. 将文件下载到本地

    ```
    wget "https://c4pr1c3.gitee.io/linuxsysadmin/exp/chap0x04/worldcupplayerinfo.tsv"
    ```

### 任务二

1. 将所需文件下载到本地，并使用sftp将文件传至虚拟机

2. 测试结果 


### 任务三

1. 安装 p7zip-full
    ```
   sudo apt-get install p7zip-full
    ```

2. 将文件下载到本地

3. 测试结果 

## 遇到的问题及解决方案

### awk出现问题
- 参考awk命令详解

### vscode ssh
- 报错信息：

```
Could not establish connection to "192.168.56.101": Permission denied (publickey,password).
```
- 操作：

- ☑️运行命令：

![ssh_免密登录配置成功](img/ssh_免密登录配置成功.png)

```
    export USER_AT_HOST=“cuc@192.168.56.101”
    export PUBKEYPATH="$HOME/.ssh/id_rsa.pub"

    ssh-copy-id -i "$PUBKEYPATH" "$USER_AT_HOST"
```

- ☑️点击F1，运行Remote-SSH：打开配置文件...，选择一个SSH配置文件，并添加（或修改）主机条目如下所示：

```
    Host name-of-ssh-host-here
    User your-user-name-on-host
    HostName host-fqdn-or-ip-goes-here
    IdentityFile ~/.ssh/id_rsa-remote-ssh
    Port 22

```

![ssh_修改config](img/ssh_修改config.png)

- ☑️打开settings.json中设置以下属性并重试：

```
    "remote.SSH.showLoginTerminal": true,
    "remote.SSH.useLocalServer": false
```

![ssh_修改setting](img/ssh_修改setting.png)
- ☑️成功

![ssh_在vscode中连接](img/ssh_在vscode中连接.png)

### host_task2出现问题
- 无法显示部分统计结果
- 不知道哪里出错，无法解决

## 参考文献

- [VScode官方文档](https://code.visualstudio.com/docs/remote/troubleshooting#_configuring-key-based-authentication)

- [SSH error in VSCode: Permission denied, please try again](https://github.com/microsoft/vscode/issues/92579)

- [Visual Studio Code 远程开发探秘](https://segmentfault.com/a/1190000019927446)


- [CUCCS/linux-2019-DcmTruman](https://github.com/CUCCS/linux-2019-DcmTruman/tree/0x04)

- [awk命令详解](https://blog.csdn.net/weixin_41477980/article/details/89511954)
