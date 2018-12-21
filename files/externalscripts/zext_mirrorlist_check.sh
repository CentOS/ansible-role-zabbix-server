#!/bin/bash
#------------------------------------------------------------
# zext_mirrorlist_check.sh
# Script checks for mirrorlist.centos.org (needs to return a list for unknown countries
#
# Macro : {$MIRRORLIST_VHOST_IP} : if apache/httpd not running on the default ip, specify it at the host level in zabbix
#------------------------------------------------------------

host=$1
vhost_ip="$2"

if [ "$vhost_ip" != '{}' ] ; then
  export is_ipv6="0"
  export host_to_check=${vhost_ip}
else
  export host_to_check=${host}
  # Detect if ipv6 as ipv6 ml doesn't include centos.org nodes for unknow countries
  is_ipv6=$(dig +short -t AAAA ${host_to_check}|wc -l)
fi


if [ "$is_ipv6" -eq "1" ] ;then
  curl --silent -H 'Host: mirrorlist.centos.org' "http://${host_to_check}/?repo=os&release=7&arch=x86_64"|grep -q 'os/x86_64' && echo $? || echo $?

else
  curl --silent -4 -H 'Host: mirrorlist.centos.org' "http://${host_to_check}/?repo=os&release=6&arch=i386&cc=unknown"|grep -q "centos.org/centos" && echo $? || echo $?
fi
