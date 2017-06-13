FROM debian:jessie
MAINTAINER Wenxuan Yang "ywx217@gmail.com"

RUN apt-get update -y \
    && apt-get install -y \
        wget

WORKDIR /root/
RUN wget -O gohttpserver "https://github.com/codeskyblue/gohttpserver/releases/download/1.0.2/gohttpserver-linux-amd64" \
    && chmod +x gohttpserver \
    && mkdir files

ADD .ghs.yml
ADD entrypoint.sh
RUN cp .ghs.yml files/


EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]
CMD ["gohttpserver", "-r ./files/", "--addr :80", "--upload", "--auth-type http", "--auth-http user:pass"]

