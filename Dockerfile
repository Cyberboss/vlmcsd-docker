FROM alpine:3.4
RUN apk add --no-cache curl g++ make

ADD https://api.github.com/repos/Wind4/vlmcsd/compare/master...HEAD /dev/null
RUN curl -SL https://github.com/Wind4/vlmcsd/archive/master.tar.gz \
  | tar -xz -C / \
  && make -C /vlmcsd-master

ENV PATH /vlmcsd-master:$PATH
EXPOSE 1688
ENTRYPOINT ["vlmcsd", "-D", "-e"]
