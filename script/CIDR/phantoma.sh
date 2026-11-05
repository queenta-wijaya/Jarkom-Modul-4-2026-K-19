#!/bin/sh
# Router: Phantoma

KNI=eth0; SHI=eth1; SW12=eth2
sysctl -w net.ipv4.ip_forward=1
for i in $KNI $SHI $SW12; do ip addr flush dev $i; ip link set $i up; done
ip addr add 10.73.3.42/30 dev $KNI
ip addr add 10.73.3.49/30 dev $SHI
ip addr add 10.73.3.1/27 dev $SW12
ip route replace 10.73.2.192/26 via 10.73.3.50
ip route replace default via 10.73.3.41
