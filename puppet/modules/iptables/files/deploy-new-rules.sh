#!/usr/bin/env bash
iptables -I INPUT 4 -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
iptables -I INPUT 4 -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
service iptables save