#!/bin/bash
wallet=钱包地址
name="$(cat /proc/sys/kernel/hostname)" && if [ -n "$1" ]; then name=$(echo "$1" | sed 's/\./-/g');fi
# proxy= SOCK5代理

(grep -q "vm.nr_hugepages" /etc/sysctl.conf || (echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf)) && sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc))) \
&& ./xmrig_subi -a ghostrider --url stratum-asia.rplant.xyz:17090 --tls --user ${wallet}.${name} --donate-level 1 -l ./xmrig_subi.log 
# -x ${proxy}

# 看日志 tail /opt/subi/xmrig_subi.log -n 100 | grep "10s/60s/15m"