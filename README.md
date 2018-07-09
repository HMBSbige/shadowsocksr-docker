# shadowsocksr-docker

## Example
```
docker pull hmbsbige/shadowsocksr-docker:latest
docker run -it -d --restart=always --name=ssr --dns 1.1.1.1 --dns 8.8.8.8 -p 80:80 -p 80:80/udp hmbsbige/shadowsocksr-docker:latest -s 0.0.0.0 -p 80 -k lajigugu -m none -O auth_chain_d -G 1#1:HMBSbige -o tls1.2_ticket_auth_compatible -t 300 --fast-open --workers 1
```

## 用配置文件运行
假设配置文件在`/root/ssconfig/1.json`
```
docker pull hmbsbige/shadowsocksr-docker:latest
docker run -it -d --restart=always --name=ssr -v /root/ssconfig:/ssconfig:ro --dns 1.1.1.1 --dns 8.8.8.8 -p 80:80 -p 80:80/udp hmbsbige/shadowsocksr-docker:latest -c /ssconfig/1.json
```

## SS
```
docker pull hmbsbige/shadowsocksr-docker:sslatest
docker run -it -d --restart=always --name=ss --dns 1.1.1.1 --dns 8.8.8.8 -p 80:80/tcp -p 80:80/udp hmbsbige/shadowsocksr-docker:sslatest -s 0.0.0.0 -p 80 -k lajigugu -m aes-256-gcm -t 300 --fast-open
```
或者跟 ssr 一样用配置文件运行
