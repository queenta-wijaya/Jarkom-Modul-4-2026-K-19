#!/bin/sh
# Router: Cyberia (port ke NAT1 tidak disentuh)

WIR=eth2; SW1=eth1
sysctl -w net.ipv4.ip_forward=1
for i in $WIR $SW1; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.26.197/30 dev $WIR
ip addr add 10.73.26.1/25 dev $SW1
ip route replace 10.73.0.0/19 via 10.73.26.198