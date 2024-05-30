while true;do
    count=$(docker ps | grep io-worker-monitor | wc -l)
    if [ 1 -eq $count ];then
    echo "running at $(date)"
    else
    echo "need to exec run.sh at $(date)"
    cd /opt/io && ./run.sh
    fi;
    # 30分钟
    sleep 1800
done

