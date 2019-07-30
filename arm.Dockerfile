FROM arm32v7/golang as builder
WORKDIR /go/src/go-kube-command
COPY main.go .
RUN go get golang.org/x/net/html && \ 
    CGO_ENABLED=0 GOOS=linux go install go-kube-command

FROM arm32v6/alpine
LABEL maintainer="cgianelle@gmail.com"
LABEL version="0.0.1"
RUN apk --no-cache add ca-certificates
RUN adduser -S -D -H -h /app gkc
USER gkc
COPY --from=builder /go/bin/go-kube-command /app/
WORKDIR /app
ENTRYPOINT [ "executable" ] ["./go-kube-command"]

 
