## zephyr
```bash
# 首次部署执行
# 配置，启动 
ansible-playbook -i ./local.hosts.conf main.yaml --skip-tags "stopminer"

# 启动未启动的
ansible-playbook -i ./local.hosts.conf main.yaml --tags "startminer"

# 停止未停止的 
ansible-playbook -i ./local.hosts.conf main.yaml --tags "stopminer"


# 查看日志
ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "powlog"

# 更新配置，重启 
ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "restart"
```