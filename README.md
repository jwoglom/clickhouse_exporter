## Fork

This is a fork of the base [clickhouse_exporter](https://github.com/Clickhouse/clickhouse_exporter) repository, with a minor fix to enable it to build properly, that is published to a [public Docker image](https://hub.docker.com/r/jwoglom/clickhouse_exporter) (jwoglom/clickhouse_exporter on Docker Hub).


# Clickhouse Exporter for Prometheus

[![Build Status](https://travis-ci.org/Percona-Lab/clickhouse_exporter.svg?branch=master)](https://travis-ci.org/Percona-Lab/clickhouse_exporter)
[![Go Report Card](https://goreportcard.com/badge/github.com/Percona-Lab/clickhouse_exporter)](https://goreportcard.com/report/github.com/Percona-Lab/clickhouse_exporter)

This is a simple server that periodically scrapes [ClickHouse](https://clickhouse.tech/) stats and exports them via HTTP for [Prometheus](https://prometheus.io/)
consumption.

To run it:

```bash
./clickhouse_exporter [flags]
```

Help on flags:
```bash
./clickhouse_exporter --help
```

Credentials(if not default):

via environment variables
```
CLICKHOUSE_USER
CLICKHOUSE_PASSWORD
```

## Using Docker

```
docker run -d -p 9116:9116 Percona-Lab/clickhouse-exporter -scrape_uri=http://clickhouse.service.consul:8123/
```
## Sample dashboard
Grafana dashboard could be a start for inspiration https://grafana.net/dashboards/882

## Docker image:
docker pull yandex/clickhouse-exporter:latest
