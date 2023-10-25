# ansible
- 版本 2.14.1

## Run
```bash
cp playbooks.yaml local.playbooks.yaml
cp hosts.conf local.hosts.conf

ansible-playbook -i ./local.hosts.conf local.playbooks.yaml
# 或
# ansible-playbook e33_var_in_command.yml --extra-vars "@local.zabbix.json"
# 或
# ansible-playbook -i ./local.hosts.conf local.playbooks.yaml --extra-vars "zabbix_server_ip=127.0.0.1"
```
## 配置
- /etc/ansible/ansible.cfg
```conf
# 增加 StrictHostKeyChecking=no 配置，免除首次登入时导致的错误 fatal: [X.X.X>X]: FAILED! => {"msg": "Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host."}
ssh_args = -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no

# forks属性，可以设置运行并行线程数。默认为5。 也可在执行指令时通过-f指定并行线程数
forks=5
```