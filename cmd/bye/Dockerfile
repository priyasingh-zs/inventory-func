FROM alpine:edge

RUN apk add --no-cache tzdata ca-certificates

COPY ./configs /configs
COPY bye ./bye

RUN chmod 777 /bye

EXPOSE 8000

CMD ["/bye"]
