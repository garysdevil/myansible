#!/bin/bash
wallet=ZEPHXXX  # 钱包地址
name="$(cat /proc/sys/kernel/hostname)" && if [ -n "$1" ]; then name="$1";fi
pool=us-zephyr.miningocean.org:5452
# proxy= # 海外SOCK5代理，否则连接矿池失败

(grep -q "vm.nr_hugepages" /etc/sysctl.conf || (echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf)) && sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc))) \
&& ./xmrig -o ${pool} -u ${wallet} -p ${name} -a rx/0 -k --donate-level 1 --tls  -l ./xmrig_zephyr.log
# -x ${proxy}