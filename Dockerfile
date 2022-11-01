FROM alpine:3.12

RUN apk add --no-cache curl openssl

# overwrite docker entrypoint
COPY ./docker-cmd.sh /docker-cmd.sh
RUN chmod +x /docker-cmd.sh
CMD /docker-cmd.sh