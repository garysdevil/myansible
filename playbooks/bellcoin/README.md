## zephyr
```bash
# 拷贝文件修改配置
mv gary_run.sh local_run.sh
vim local_run.sh
```
```bash
# 首次部署执行
# 配置，启动 
ansible-playbook -i ./local.hosts.conf main.yaml --skip-tags "stopminer" -e "hosts=all"

# 启动未启动的
ansible-playbook -i ./local.hosts.conf main.yaml --tags "startminer" -e "hosts=all"

# 停止未停止的 
ansible-playbook -i ./local.hosts.conf main.yaml --tags "stopminer" -e "hosts=all"


# 查看日志
ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "powlog" -e "hosts=all"

# 更新配置，重启 
ansible-playbook -i ./local.hosts.conf main_2.yaml --tags "restart" -e "hosts=all"
```