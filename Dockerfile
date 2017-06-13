FROM debian:jessie
MAINTAINER Wenxuan Yang "ywx217@gmail.com"

RUN apt-get update -y \
    && apt-get install -y \
        wget

WORKDIR /root/
RUN wget -O gohttpserver "https://github.com/codeskyblue/gohttpserver/releases/download/1.0.2/gohttpserver-linux-amd64" \
    && chmod +x gohttpserver \
    && mkdir files

COPY .ghs.yml /root/files/
COPY config.yml /root/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80
ENTRYPOINT ["./gohttpserver"]
CMD ["--conf=config.yml"]

