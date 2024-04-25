# 文档
```bash
# 启动挖矿程序
ansible-playbook -i ./local.hosts.conf start.yaml -e "group=test"

# 检查日志
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=test" --tag "checklog"

# 停止挖矿程序
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=test" --tag "stopmine"
```