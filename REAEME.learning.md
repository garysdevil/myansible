## Learning
```bash
# 输出远程服务器的所有facts信息 ansible.builtin.setup
ansible -i ./local.hosts.conf ${group_name} -m setup
# facts信息过滤
ansible -i ./local.hosts.conf ${group_name} -m setup -a 'filter=all_ipv4_addresses'
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