#!/bin/sh
# Router: Shibuya

PHA=eth0; SW13=eth1
sysctl -w net.ipv4.ip_forward=1
for i in $PHA $SW13; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.3.50/30 dev $PHA
ip addr add 10.73.2.193/26 dev $SW13
ip route replace default via 10.73.3.49
