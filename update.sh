#!/usr/bin/env bash
curl 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep ipv4 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > roles/chinadns/files/chnroute.txt
curl  https://cokebar.github.io/gfwlist2dnsmasq/dnsmasq_gfwlist_ipset.conf -o roles/dnsmasq/templates/dnsmasq_gfwlist_ipset.conf.j2
sed -i '' 's/5353/{{ chinadns.port }}/g'  roles/dnsmasq/templates/dnsmasq_gfwlist_ipset.conf.j2
 
 
 