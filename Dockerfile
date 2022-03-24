FROM golang:1.16 as builder

RUN go get go.uber.org/sally

FROM alpine:3.15

RUN mkdir -p /app
COPY config.yml /app/config.yml
COPY --from=builder /go/bin/sally /app/sally

EXPOSE 8080
WORKDIR /app

CMD /app/sally -yml config.yml -port 8080
