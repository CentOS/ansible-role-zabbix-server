#!/bin/bash
#------------------------------------------------------------
# zext_mirrorlist_check.sh
# Script checks for mirrorlist.centos.org : response time
# Macro : {$MIRRORLIST_VHOST_IP} : if apache/httpd not running on the default ip, specify it at the host level in zabbix
#------------------------------------------------------------

host=$1
vhost_ip="$2"

if [ "$vhost_ip" != '{}' ] ; then
  export host_to_check=${vhost_ip}
else
  export host_to_check=${host}
fi

curl --silent -w "%{time_total}" -H 'Host: mirrorlist.centos.org' "http://${host_to_check}/?repo=os&release=7&arch=x86_64" -o /dev/null

