#!/bin/bash
# V2Ray new configuration
echo "$CONFIG_JSON" > /etc/v2ray/config.json

#run zerotier 
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" | cut -f 2 -d ":" | cut -f 1 -d " " )
echo $resultip
echo "------------"
/kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 &

#run kcp
/server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2&

#run shadow
/shadowsocks-server-linux64-1.1.5 -c ./ss-configcodeing.json &

# Run V2Ray
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
