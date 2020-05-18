#!/bin/sh

if [ ! -z $NET ] && [ -z $CIDR ] ; then
    sed -i 's/192.168.0.0\/16/'$NET'/' /etc/squid/squid.conf
fi

if [ -z $NET ] && [ ! -z $CIDR ] ; then
    sed -i 's/192.168.0.0\/16/192.168.0.0\/'$CIDR'/' /etc/squid/squid.conf
fi

if [ ! -z $NET ] && [ ! -z $CIDR ] ; then
    sed -i 's/192.168.0.0\/16/'$NET'\/'$CIDR'/' /etc/squid/squid.conf
fi

exec /usr/sbin/squid -N -d 0 -f /etc/squid/squid.conf