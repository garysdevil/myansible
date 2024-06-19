# 文档
```bash
vim local.hosts.conf
```
```bash
# 部署，启动程序
ansible-playbook -i ./local.hosts.conf deploy.yaml -e "group=run"

# 启动程序
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "startminer"

# 检查日志
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checklog"

# 停止程序
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "stopminer"

# 查看程序状态
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checkminer"
```