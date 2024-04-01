FROM debian:stable-slim

LABEL maintainer "Jim Clausing, jclausing@isc.sans.edu"
LABEL version="hayabusa 2.14.0"
LABEL description="Run hayabusa in a docker container"

WORKDIR /app

RUN apt update && \
    apt install wget unzip -y && \
    apt clean && \
    wget https://github.com/Yamato-Security/hayabusa/releases/download/v2.14.0/hayabusa-2.14.0-linux.zip && \
    unzip hayabusa*.zip && \
    ln -s hayabusa*-musl hayabusa && \
    chmod a+x /app/hayabusa && \
    rm -vf *.tar.gz *.zip

RUN /app/hayabusa update-rules

ENTRYPOINT ["/app/hayabusa"]
CMD ["help"]
