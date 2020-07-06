FROM golang:1.14.4 AS builder
RUN go get -d -v github.com/mangalaman93/training
WORKDIR /go/src/github.com/mangalaman93/training
COPY main.go .
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -a -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/mangalaman93/training/app .
EXPOSE 8080
CMD ["./app"]
