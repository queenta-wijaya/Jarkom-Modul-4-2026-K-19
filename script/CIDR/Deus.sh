#!/bin/sh
# Router: Navi

WIR=eth0; SW6=eth1; SW7=eth2; SW8=eth3
sysctl -w net.ipv4.ip_forward=1
for i in $WIR $SW6 $SW7 $SW8; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.26.194/30 dev $WIR
ip addr add 10.73.24.1/24 dev $SW6
ip addr add 10.73.26.129/26 dev $SW7
ip addr add 10.73.25.1/24 dev $SW8
ip route replace default via 10.73.26.193