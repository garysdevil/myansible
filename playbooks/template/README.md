# 文档
```bash
vim local.hosts.conf
```

```bash
# 部署，启动程序
ansible-playbook -i ./local.hosts.conf deploybyrun.yaml -e "group=run"

# 启动程序
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "startminer"

# 检查日志
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checklog"

# 停止程序
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "stopminer"

# 查看程序状态
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checkminer"

# 查看块高
ansible-playbook -i ./local.hosts.conf main.yaml -e "group=run" --tag "checkheight"
```

```bash
# 部署，启动程序
ansible-playbook -i ./local.hosts.conf deploybyservice.yaml --skip-tags "reloadconfig" -e "group=run"
# 部署，更改service配置，重启程序
ansible-playbook -i ./local.hosts.conf deploybyservice.yaml -e "group=run"
```