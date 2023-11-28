#!/bin/bash
wallet=$1
name="$(cat /proc/sys/kernel/hostname)" && if [ -n "$1" ]; then name="$1";fi
# proxy= SOCK5代理

(grep -q "vm.nr_hugepages" /etc/sysctl.conf || (echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf)) && sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc))) \
&& ./xmrig_subi -a ghostrider --url stratum-asia.rplant.xyz:17090 --tls --user ${wallet}.${name} -l ./xmrig_subi.log 
# -x ${proxy}