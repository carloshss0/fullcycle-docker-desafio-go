FROM golang:alpine as builder

WORKDIR /usr/src/app
COPY main.go /usr/src/app/

RUN go env -w GO111MODULE=auto
RUN go build -o main .

FROM scratch

WORKDIR /app
COPY --from=builder /usr/src/app/main .

CMD ["./main"]

