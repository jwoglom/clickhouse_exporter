FROM golang:1.15 AS BUILD

LABEL maintainer="Roman Tkalenko"

COPY . /go/src/github.com/Percona-Lab/clickhouse_exporter

WORKDIR /go/src/github.com/Percona-Lab/clickhouse_exporter

RUN make init && make -j4

FROM frolvlad/alpine-glibc:alpine-3.8

COPY --from=BUILD /go/bin/clickhouse_exporter /usr/local/bin/clickhouse_exporter

ENTRYPOINT ["/usr/local/bin/clickhouse_exporter"]

CMD ["-scrape_uri=http://localhost:8123"]

EXPOSE 9116
