# shadowsocksr-docker

## Example
```
docker pull hmbsbige/shadowsocksr-docker:latest
docker run --restart=always --name=ssr --dns 1.1.1.1 --dns 8.8.8.8 -d -p 80:80 -e "PASSWORD=psw"  hmbsbige/shadowsocksr-docker:latest
docker run --restart=always --name=ss --dns 1.1.1.1 --dns 8.8.8.8 -d -p 443:80 -e "PASSWORD=psw" -e "METHOD=chacha20-ietf" -e "PROTOCOL=origin" hmbsbige/shadowsocksr-docker:latest
```

## 默认参数
```
ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     80
ENV PASSWORD        psw
ENV METHOD          none
ENV PROTOCOL        auth_chain_d
ENV PROTOCOLPARAM   32
ENV OBFS            tls1.2_ticket_auth_compatible
ENV TIMEOUT         300
ENV WORKERS         1
```

## 用配置文件运行
假设配置文件在```~/ssconfig/1.json```
```
docker pull hmbsbige/shadowsocksr-docker:config
docker run --restart=always --name=ssr --dns 1.1.1.1 --dns 8.8.8.8 -v ~/ssconfig:/ssconfig:ro -e "CONFDIR=/ssconfig" -e "CONF=1.json" --expose=80 --expose=443 -p 80:80 -p 443:443 -d hmbsbige/shadowsocksr-docker:config
```
