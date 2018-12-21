#!/bin/bash
#------------------------------------------------------------
# zext_mirrorlist_check.sh
# Script checks for mirrorlist.centos.org (needs to return a list for unknown countries
#
# Macro : {$MIRRORLIST_VHOST_IP} : if apache/httpd not running on the default ip, specify it at the host level in zabbix
#------------------------------------------------------------

host=$1
is_ipv6=$(dig +short -t AAAA ${host}|wc -l)



if [ "$is_ipv6" -eq "0" ] ;then
  echo 0
else
  ping6 -n -W 2 -q -c 1 $1 >/dev/null 2>&1 ; echo $?
fi
