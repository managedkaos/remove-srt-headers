FROM alpine:latest
COPY entrypoint.sh /usr/local/bin/clean-file
RUN chmod +x /usr/local/bin/clean-file
ENTRYPOINT ["clean-file"]
