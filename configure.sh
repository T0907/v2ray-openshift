#!/bin/bash
# V2Ray new configuration
echo "$CONFIG_JSON" > /etc/v2ray/config.json

#run zerotier 
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" )
echo $resultip
#/kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 &

#run kcp
#/server_linux_amd64 -t 127.0.0.1:8080 -l :3824 --mode fast2&

# Run V2Ray
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
