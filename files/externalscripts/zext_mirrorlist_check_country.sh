#!/bin/bash
#------------------------------------------------------------
# zext_mirrorlist_check.sh
# Script checks for mirrorlist.centos.org (needs to return a list for unknown countries
#
# Macro : {$MIRRORLIST_VHOST_IP} : if apache/httpd not running on the default ip, specify it at the host level in zabbix
#------------------------------------------------------------

host=$1

export host_to_check=${host}

curl --silent -H 'Host: mirrorlist.centos.org' "http://${host_to_check}/?release=7&arch=x86_64&repo=os&cc=nl"|grep -q '.nl/' && echo $? || echo $?

