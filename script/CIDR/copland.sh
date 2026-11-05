#!/bin/sh
# Router: Copland

SW2=eth0; JURI=eth1; SW4=eth2
sysctl -w net.ipv4.ip_forward=1
for i in $SW2 $JURI $SW4; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.6.83/29 dev $SW2
ip addr add 10.73.6.1/26 dev $JURI
ip addr add 10.73.4.1/23 dev $SW4
ip route replace default via 10.73.6.81
