FROM alpine:edge
RUN apk add --update --progress \
        musl \
        build-base \
        python3 \
        python3-dev \
        bash \
        git \
    && pip3 install --no-cache-dir --upgrade pip

RUN cd /usr/bin \
    && ln -sf python3 python \
    && ln -sf pip3 pip
gosu COPY entrypoint.sh /entrypoint.sh
RUN gosu chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
# CMD ["--help"]    
