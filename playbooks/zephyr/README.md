```bash
# 首次部署执行
# 配置，启动 
ansible-playbook -i ./local.hosts.conf zephyr.yaml --skip-tags "stopminer"

# 启动未启动的
ansible-playbook -i ./local.hosts.conf zephyr.yaml --tags "startminer"

# 停止未停止的 
ansible-playbook -i ./local.hosts.conf zephyr.yaml --tags "stopminer"


# 更新配置，重启 
ansible-playbook -i ./local.hosts.conf zephyr_restart.yaml
```
