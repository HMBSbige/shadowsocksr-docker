FROM alpine:3.7

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

ARG BRANCH=manyuser
ARG WORK=~


RUN apk --no-cache add python \
	libsodium \
	wget


RUN mkdir -p $WORK && \
	wget -qO- --no-check-certificate https://github.com/HMBSbige/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK


WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks


EXPOSE $SERVER_PORT
CMD python server.py -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G $PROTOCOLPARAM -t $TIMEOUT --fast-open --workers $WORKERS
