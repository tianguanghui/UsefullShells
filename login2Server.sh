#!/bin/bash

DEFAULT_SERVER_PORT=22
DEFAULT_LOGIN_USER="root"

# 别名配置在 /etc/hosts里
read -p "请输入服务器别名：" server_aliasName

if [ ! ${server_aliasName} ]; then
	echo "别名不能为空，程序已退出！！！"
	exit 1
fi

read -p "请指定登录用户(默认root)：" login_name

if [ ${login_name} ]; then
	DEFAULT_LOGIN_USER=${login_name}
fi

read -p "请指定服务器端口(默认22)：" server_port

if [ ${server_port} ]; then
	DEFAULT_SERVER_PORT=${server_port}
fi

echo "ssh ${DEFAULT_LOGIN_USER}@${server_aliasName} -p${DEFAULT_SERVER_PORT}"

ssh "${DEFAULT_LOGIN_USER}@${server_aliasName} -p${DEFAULT_SERVER_PORT}"
