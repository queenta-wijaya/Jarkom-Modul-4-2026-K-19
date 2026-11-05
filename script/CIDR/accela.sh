#!/bin/sh
# Router: Accela

SCH=eth0; SW5=eth1
sysctl -w net.ipv4.ip_forward=1
for i in $SCH $SW5; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.6.74/30 dev $SCH
ip addr add 10.73.20.1/22 dev $SW5
ip route replace default via 10.73.6.73
