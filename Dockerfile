FROM golang:1.9.2-alpine as builder
WORKDIR /api/src
COPY . .
RUN go test -v --cover ./...
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o api .

FROM alpine:3.6
ENV DBHOST=dockermongo
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /api/src .
CMD ["./api"]