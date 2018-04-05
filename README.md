# shadowsocksr-docker

## Example
```
docker pull hmbsbige/shadowsocksr-docker:latest
docker run -d -p 80:80 -e "PASSWORD=lajigugu"  hmbsbige/shadowsocksr-docker:latest
docker run -d -p 465:80 -e "PASSWORD=lajigugu" -e "METHOD=chacha20" -e "PROTOCOL=origin" hmbsbige/shadowsocksr-docker:latest
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
ENV DNS_ADDR        1.1.1.1
ENV DNS_ADDR_2      8.8.8.8
```
