# build executable
FROM golang:1.16 as builder

WORKDIR /go/src/app
ADD . /go/src/app

RUN make all

# run distroless
FROM gcr.io/distroless/base-debian10

WORKDIR /opt/app

COPY --from=builder /go/src/app/bin/main .

ENTRYPOINT [ "/opt/app/main" ]