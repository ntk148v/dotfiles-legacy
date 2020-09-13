#!/bin/bash
default_vpn_gw=$(route -n | grep -m1 0.0.0.0 | awk '{print $2}')
ip route del default via $default_vpn_gw dev tun0
#ip route delete 128.0.0.0/1
ip route add 10.61.123.0/24 dev tun0 via $default_vpn_gw
