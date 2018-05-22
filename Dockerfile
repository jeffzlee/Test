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
COPY entrypoint.sh /opt/entrypoint.sh
RUN gosu chmod 777 /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh" ]
EXPOSE 80
CMD ["kkkkk"]    
