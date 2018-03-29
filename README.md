# shadowsocksr-docker

## Example
```
docker pull hmbsbige/shadowsocksr-docker:0.1
docker run -d -p 80:80 -e "PASSWORD=lajigugu"  hmbsbige/shadowsocksr-docker:0.1
docker run -d -p 443:80 -e "PASSWORD=lajigugu" -e "PROTOCOL=auth_chain_a" hmbsbige/shadowsocksr-docker:0.1
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
