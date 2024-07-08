## -
```bash
mkdir files && cd files
wget https://golang.org/dl/go1.22.4.linux-amd64.tar.gz
cd ..

ansible-playbook -i ./local.hosts.conf go_install.yaml
```