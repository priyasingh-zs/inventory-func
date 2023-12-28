FROM alpine:edge

RUN apk add --no-cache tzdata ca-certificates

COPY ./configs /configs
COPY hello ./hello

RUN chmod 777 /hello

EXPOSE 8000

CMD ["/hello"]
