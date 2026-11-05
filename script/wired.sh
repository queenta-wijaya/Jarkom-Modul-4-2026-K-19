#!/bin/sh
# Router: Wired

CYB=eth0; TAC=eth1; NAV=eth2; SW2=eth3
sysctl -w net.ipv4.ip_forward=1
for i in $CYB $TAC $NAV $SW2; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.26.198/30 dev $CYB
ip addr add 10.73.3.61/30 dev $TAC
ip addr add 10.73.26.193/30 dev $NAV
ip addr add 10.73.6.81/29 dev $SW2
ip route replace 10.73.0.0/22 via 10.73.3.62
ip route replace 10.73.24.0/23 via 10.73.26.194
ip route replace 10.73.26.128/26 via 10.73.26.194
ip route replace 10.73.26.0/25 via 10.73.26.197
ip route replace 10.73.16.0/22 via 10.73.6.82
ip route replace 10.73.4.0/23 via 10.73.6.83
ip route replace 10.73.6.0/26 via 10.73.6.83
ip route replace 10.73.20.0/22 via 10.73.6.84
ip route replace 10.73.6.64/29 via 10.73.6.84
ip route replace 10.73.6.72/30 via 10.73.6.84
ip route replace blackhole 10.73.0.0/19
ip route replace default via 10.73.26.197