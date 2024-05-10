#!/bin/bash

# 检查第一个参数是否为空
if [ -z "$1" ]; then
    # 如果第一个参数为空，则设置vax为机器的主机名
    ansible_ssh_host=$(hostname)
else
    # 如果第一个参数不为空，则设置vax为该参数
    ansible_ssh_host=$1
fi

mine_rig=miner_rig
ip_port=1.1.1.1:1111
wallet_address=xxxxx
log_path=${mine_rig}.log

nohup ./${mine_rig} --host ${ip_port}  --wallet ${wallet_address}  --boost --worker ${ansible_ssh_host} >> ${log_path} 2>&1 &