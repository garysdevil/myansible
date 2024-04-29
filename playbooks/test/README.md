# 文档
```bash
# 部署启动挖矿程序
ansible-playbook -i ./local.hosts.conf start.yaml -e "group=run"

# 检查日志
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checklog"

# 停止挖矿程序
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "stopminer"

# 查看程序状态
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checkminer"
```