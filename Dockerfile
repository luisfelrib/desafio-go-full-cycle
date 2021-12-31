FROM golang:alpine as builder

WORKDIR /usr/src/app 

COPY full_cycle.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build full_cycle.go

FROM scratch

WORKDIR /usr/bin/

COPY --from=builder /usr/src/app/full_cycle .

ENTRYPOINT ["full_cycle"]
