device_name='xx'
device_id='xx-xx-xx'
user_id='xx-xx-xx'
token='xx'
cd /opt/io/ && ./io_net_launch_binary_linux --device_id=${device_id} --user_id=${user_id} --operating_system='Linux' --usegpus=true --device_name=${device_name} --token=${token} --no_warnings='true