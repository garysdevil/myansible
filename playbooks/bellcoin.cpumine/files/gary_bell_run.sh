#!/bin/bash
wallet=钱包地址

name="$(cat /proc/sys/kernel/hostname)" && if [ -n "$1" ]; then name="$1";fi
proxy=socks5://SOCK5代理 # SOCK5代理
pool=stratum+tcps://198.50.168.213:56234 # stratum+tcp://mine.zpool.ca:6234

nohup ./cpumine -a yespower -u ${wallet} -p ${name},c=BELL,zap=BELL -o ${pool} -x  ${proxy} >> cpumine_bellcoin.log 2>&1 &