#!/usr/bin/env bash
curl 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep ipv4 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > roles/chinadns/files/chnroute.txt
curl  https://cokebar.github.io/gfwlist2dnsmasq/dnsmasq_gfwlist_ipset.conf -o roles/dnsmasq/files/dnsmasq_gfwlist_ipset.conf


# tb.txt
bestroutetb -p custom --rule-format=$'%prefix/%length\n' --group-header=$'---%name-start\n' --group-footer=$'---%name-end\n' --group-gateway -f -o /tmp/chnroutes.txt
sed -e '/---vpn-start/,/---vpn-end/d' -e '/^---/d' /tmp/chnroutes.txt > /tmp/tb.txt
cp /tmp/tb.txt roles/gateway/files/chnroute.txt
 
 