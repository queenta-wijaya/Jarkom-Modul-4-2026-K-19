#!/bin/sh
# Router: Psyche

SW2=eth0; SW3=eth1
sysctl -w net.ipv4.ip_forward=1
for i in $SW2 $SW3; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.6.82/29 dev $SW2
ip addr add 10.73.16.1/22 dev $SW3
ip route replace default via 10.73.6.81
