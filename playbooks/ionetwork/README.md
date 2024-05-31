## IOnetwork
1. 下载好镜像
```bash
docker save ionetcontainers/io-launch:v0.1 -o io-launch-0530.tar
```

2. 执行playbook
```bash
ansible-playbook -i ./hosts main.yaml --limit ${device_ip} -e "device_name=${device_name} device_id=${device_id}" -v

ansible-playbook -i ./hosts main.yaml --tag "status"
```

## Todo
- run.sh 文件使用ansible变量，部署时，填入变量值，将run.sh文件拷贝进远程机器内。