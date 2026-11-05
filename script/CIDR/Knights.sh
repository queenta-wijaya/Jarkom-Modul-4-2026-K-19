#!/bin/sh
# Router: Tachibana

WIR=eth0; SW9=eth1; DEU=eth2
sysctl -w net.ipv4.ip_forward=1
for i in $WIR $SW9 $DEU; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.3.62/30 dev $WIR
ip addr add 10.73.0.1/23 dev $SW9
ip addr add 10.73.3.57/30 dev $DEU
for d in 10.73.2.0/25 10.73.2.128/26 10.73.2.192/26 10.73.3.0/27 10.73.3.32/29 10.73.3.40/30 10.73.3.44/30 10.73.3.48/30 10.73.3.52/30; do ip route replace $d via 10.73.3.58; done
ip route replace default via 10.73.3.61