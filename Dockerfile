FROM golang:alpine AS builder
COPY . /usr/local/go/src/github-release-getter
WORKDIR /usr/local/go/src/github-release-getter
RUN CGO_ENABLED=0 go build -o /usr/bin/github-release-getter github-release-getter

###
FROM alpine AS final
ENTRYPOINT ["/usr/bin/github-release-getter"]
COPY --from=builder /usr/bin/github-release-getter /usr/bin/