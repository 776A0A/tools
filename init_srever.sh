#!/bin/bash

function run_firewalld() {
    run_command systemctl start firewalld
    run_command systemctl enable firewalld
    run_command firewall-cmd --permanent --zone=public --add-service=http --add-service=https
    run_command firewall-cmd --reload
}

function run_nginx() {
    if systemctl is-active --quiet nginx; then
        echo_red "nginx已经安装！"
    else
        echo_green "开始安装nginx..."
        run_command rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

        run_command yum install nginx -y
        echo_green "nginx安装成功！"

        echo "Nginx configuration file is located at: /etc/nginx/nginx.conf"

        echo_green "启动nginx..."
        run_command systemctl start nginx

        run_command systemctl enable nginx
        echo_green "nginx已设置开机自启！"
    fi
}

function run_mysql() {
    if systemctl is-active --quiet mysqld; then
        echo_red "mysql已经安装！"
    else
        echo_green "开始安装mysql..."

        if ! rpm -qa | grep -qw mysql80-community-release-el7-3; then
            run_command rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
        fi

        run_command rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

        run_command yum install mysql-community-server -y
        echo_green "mysql安装成功！"
        echo_green "mysql配置文件地址：/etc/my.cnf"
        echo_green "mysql数据库存储地址：/var/lib/mysql"

        echo_green "启动mysql..."
        run_command systemctl start mysqld

        run_command systemctl enable mysqld
        echo_green "mysql已设置开机自启！"
    fi
}

function run_command() {
    if ! "$@"; then
        echo_red "命令执行失败: $@"
        exit 1
    fi
}

function echo_green() {
    echo -e "\033[32m$@\033[0m"
}

function echo_red() {
    echo -e "\033[31m$@\033[0m"
}

function main() {
    run_firewalld
    run_nginx
    run_mysql
}

main
