#!/bin/bash
wallet=钱包地址
name="$(cat /proc/sys/kernel/hostname)" && if [ -n "$1" ]; then name="$1";fi
pool=us-zephyr.miningocean.org:5452
# proxy= # SOCK5代理

(grep -q "vm.nr_hugepages" /etc/sysctl.conf || (echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf)) && sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc))) \
&& ./xmrig -o ${pool} -u ${wallet} -p ${name} -a rx/0 -k --donate-level 1 -l ./xmrig_zephyr.log --tls --cpu-max-threads-hint 90
# -x ${proxy} # SOCK5代理
# --tls # 使用SSL连接
# --cpu-max-threads-hint 90 # 最大使用的线程数量，单位百分比

# 看日志 tail /opt/zephyr/xmrig_zephyr.log -n 100 | grep "10s/60s/15m"