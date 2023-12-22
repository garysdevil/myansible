
#!/bin/bash
wallet=钱包地址
name="$(cat /proc/sys/kernel/hostname)" && if [ -n "$1" ]; then name="$1";fi
pool=stratum+tcp://yespower.jp1.mine.leywapool.com:6322
proxy=socks5://SOCK5代理

./minerd -a scrypt -o ${pool} -u ${wallet} -p ${name} -x ${proxy}

# pool=stratum+tcps://198.50.168.213:56234  # zpool 矿池
# ./cpuminer -a yespower -u ${wallet} -p ${name},c=BELL,zap=BELL -o ${pool} -x  ${proxy}
