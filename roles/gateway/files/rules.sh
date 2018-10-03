#!/usr/bin/env bash
# ipset
ipset create loprivate hash:net
ipset add loprivate 0.0.0.0/8
ipset add loprivate 10.0.0.0/8
ipset add loprivate 127.0.0.0/8
ipset add loprivate 169.254.0.0/16
ipset add loprivate 172.16.0.0/12
ipset add loprivate 192.168.0.0/16
ipset add loprivate 224.0.0.0/4
ipset add loprivate 240.0.0.0/4

ipset create chnip hash:net
while read rule; do (ipset add chnip $rule); done < /opt/chinadns/chnroute.txt 

ipset create gfwlist hash:ip


# iptables
# nat
iptables -t nat -N SHADOWSOCKS
iptables -t nat -A SHADOWSOCKS -d <serverip> -j RETURN
iptables -t nat -A SHADOWSOCKS -d <serverip> -j RETURN
iptables -t nat -A SHADOWSOCKS -m set --match-set loprivate dst -j RETURN
iptables -t nat -A SHADOWSOCKS -m set --match-set chnip dst -j RETURN
#iptables -t nat -A SHADOWSOCKS -p tcp -j REDIRECT --to-ports 1081
iptables -t nat -A SHADOWSOCKS -p tcp -m set --match-set gfwlist dst -j REDIRECT --to-port 1081
iptables -t nat -A PREROUTING -p tcp -j SHADOWSOCKS
iptables -t nat -A OUTPUT -p tcp -j SHADOWSOCKS

# mangle
# iptables -t mangle -N SHADOWSOCKS

# Add any UDP rules
#ip route add local default dev lo table 100
#ip rule add fwmark 1 lookup 100
#iptables -t mangle -A SHADOWSOCKS -p udp --dport 53 -j TPROXY --on-port 1081 --tproxy-mark 0x01/0x01

# iptables -t mangle -A PREROUTING -j SHADOWSOCKS
