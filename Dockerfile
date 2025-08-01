FROM debian:stable-slim

LABEL maintainer="Jim Clausing, jclausing@isc.sans.edu"
LABEL version="hayabusa 3.4.0"
LABEL description="Run hayabusa in a docker container"

WORKDIR /app

RUN apt update && \
    apt install wget unzip -y && \
    apt clean && \
    wget https://github.com/Yamato-Security/hayabusa/releases/download/v3.4.0/hayabusa-3.4.0-lin-x64-musl.zip && \
    unzip hayabusa*.zip && \
    #mv hayabusa*-musl hayabusa-dir && \
    #mv hayabusa-dir/* . && \
    rm -rf hayabusa-dir && \
    ln -s hayabusa*-musl hayabusa && \
    chmod a+x /app/hayabusa && \
    rm -vf *.tar.gz *.zip

RUN /app/hayabusa update-rules 

ENTRYPOINT ["/app/hayabusa"]
CMD ["help"]
