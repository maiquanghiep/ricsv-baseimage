FROM riscv64/debian:sid-slim

ENV GOLANG_VERSION 1.14.2

RUN apt-get update && apt-get install -y ca-certificates wget && rm -rf /var/lib/apt/lists/*

ADD go-1.14.2-riscv64.tar.gz /usr/local/

RUN export PATH="/usr/local/go/bin:$PATH"; \
    go version

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH


RUN wget http://ftp.debian.org/debian/pool/main/g/git/git-man_2.30.2-1_all.deb -O git-man_2.30.2.deb
RUN dpkg -i git-man_2.30.2.deb
