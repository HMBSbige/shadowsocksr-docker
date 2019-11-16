# shadowsocksr-docker

## ss-manager-v2 
假设配置文件在`/root/ssconfig/1.json`
```
docker run -itd \
--restart=always \
--name=ssv2 \
-v /root/ssconfig:/ssconfig:ro \
-p 80:80 \
-p 80:80/udp \
hmbsbige/shadowsocksr-docker:ss-manager-v2 \
-c /ssconfig/1.json
```
