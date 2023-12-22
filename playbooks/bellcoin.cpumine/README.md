## zephyr
```bash
# 首次部署：
# 1. 拷贝文件修改启动配置 钱包地址等信息
mv gary_bell_run.sh local_bell_run.sh
vim local_bell_run.sh
# 2. 创建 inventory 文件
vim local.hosts.conf

# 3. 远程传递配置文件，启动 
ansible-playbook -i ./local.hosts.conf main.yaml --skip-tags "stopminer" -e "hosts=all"
```

```bash
# 启动未启动的
ansible-playbook -i ./local.hosts.conf main.yaml --tags "startminer" -e "hosts=all"

# 停止未停止的 
ansible-playbook -i ./local.hosts.conf main.yaml --tags "stopminer" -e "hosts=all"


# 查看日志
ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "powlog" -e "hosts=all"

# 远程更新配置文件，重启 
ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "restart" -e "hosts=all"

ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "dependency" -e "hosts=all"
```