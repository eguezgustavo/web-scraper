FROM golang:1.21.0-bullseye AS Development
COPY ./ /app
WORKDIR /app
RUN apt-get update && \
    apt-get -y install git curl && \
    go install golang.org/x/tools/cmd/goimports@latest && \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.54.1
RUN go build -o /bin/webscraper ./webscraper/main.go
CMD ["tail", "-f", "/dev/null"]

FROM debian:bullseye AS Production
COPY --from=0 /bin/webscraper /bin/webscraper
CMD ["/bin/webscraper"]
