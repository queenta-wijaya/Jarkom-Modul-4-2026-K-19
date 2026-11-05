#!/bin/sh
# Router: Schumann

SW2=eth0; AKA=eth1; ACC=eth2
sysctl -w net.ipv4.ip_forward=1
for i in $SW2 $AKA $ACC; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.6.84/29 dev $SW2
ip addr add 10.73.6.65/29 dev $AKA
ip addr add 10.73.6.73/30 dev $ACC
ip route replace 10.73.20.0/22 via 10.73.6.74
ip route replace default via 10.73.6.81
