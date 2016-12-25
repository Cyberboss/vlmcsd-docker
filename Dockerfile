FROM alpine:3.4
MAINTAINER Bjorn Neergaard <bjorn@neersighted.com>

RUN apk add --no-cache curl g++ make
RUN curl -SL https://github.com/Wind4/vlmcsd/archive/master.tar.gz \
  | tar -xz -C / \
  && make -C /vlmcsd-master
RUN apk del curl g++ make

ENV PATH /vlmcsd-master/bin:$PATH
EXPOSE 1688

ENTRYPOINT ["vlmcsd", "-D", "-e", "-j", "/vlmcsd-master/etc/vlmcsd.kmd"]
