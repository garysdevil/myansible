## Learning
```bash
# 输出远程服务器的所有facts信息 ansible.builtin.setup
ansible -i ./local.hosts.conf ${group_name} -m setup
# facts信息过滤
ansible -i ./local.hosts.conf ${group_name} -m setup -a 'filter=all_ipv4_addresses'
```

### ansible-playbook
```bash
# 在每个任务前会自动停止,并询问是否应该执行该任务.
--step

# 从指定的任务开始执行playbook
--start-at="install packages"

# 通过指定tags执行部分功能
--tags "packages"
# 所有有tag的任务
--tags tagged
# 所有没有tag的任务
--tags untagged

# 通过指定tags不执行部分功能
--skip-tags "configuration"

# 指定并发数量
-f 10

# Ansible 连接到远程主机时等待 SSH 连接建立的最长时间，默认值为10秒
-e ansible_ssh_timeout=30
```


### module
- 注意点讲解

1. debug
    ```yaml
    # 执行shell并且输出执行结果
    tasks:
    - name: Command run line 
        shell: date 
        register: result 
    - name: Show debug info 
        debug: var=result.stdout_lines verbosity=0
    ```

2. lineinfile
    - 替换操作，默认只会替换文件内最后一个符合正则表达式内容的语句
    - 如果找不到被匹配的字符串，则会添加新的内容
    ```yaml
    - name: update_etc_hosts
        lineinfile:
        path: /etc/hosts
        state: present
        regexp: ' garys.top'
        line: "{{ ip }}  garys.top"
        become: yes
    ```

3. script 将脚本传入远程主机并且执行
    ```yaml
        - name: Execute your script
        script: ./local/test.sh
    ```

4. async 和 poll
```yaml
    - name: Run updatedb
        command: /usr/bin/updatedb
        async: 300 # async的值是ansible等待运行这个任务的最大超时值
        poll: 10 # poll就是ansible检查这个任务是否完成的频率时间
```

### Jinja
- jinja2 文件以 .j2 为后缀， 也可以不写后缀。
- jinja2 中存在 三种定界符
```
# 注释:    
{# #}

# 变量引用:  
{{}}

# 逻辑表达:  
{%%}

# 条件语句
{% if %}
...
...
{% endif %}

# 循环
{% for %}
...
...
{% endfor %}
```

### ansible.cfg
- ansible.cfg配置文件位置
    - ANSIBLE_CONFIG   如果设置了该环境变量，则使用该环境变量指向的配置文件
    - ./ansible.cfg    在当前目录中搜索配置文件
    - ~/.ansible.cfg   在当前用户的home目录下的配置文件
    - /etc/ansible/ansible.cfg  ansible默认的配置文件
    - 从上到下，优先级递减

## AsAnInterviewer
- 考察面试者是否使用过ansible，是否编写过ansible，对ansible的编写是否熟练。

1. 修改远程服务器的/etc/hosts信息，并且输出修改后的/etc/hosts文件信息
    1. 怎么编写剧本
    2. 使用到什么模块

2. 