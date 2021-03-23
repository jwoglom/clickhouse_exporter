all: build test

init:	
	mkdir -p /go/src/github.com/google/go-github
	(cd /go/src/github.com/google/go-github && git clone https://github.com/google/go-github v25)
	(cd /go/src/github.com/google/go-github/v25 && git checkout tags/v25.1.3 -b v25 && git branch --set-upstream-to=origin/master v25)
	go get -u github.com/prometheus/promu
	go get -u github.com/AlekSi/gocoverutil

build:
	go install -v
	promu build

test:
	go test -v -race
	gocoverutil -coverprofile=coverage.txt test -v
