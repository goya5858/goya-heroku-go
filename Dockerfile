#build stage
FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .
ENV GO111MODULE=on
RUN go build -o main

#final stage
FROM gcr.io/distroless/base
COPY --from=builder /go/src/app/main /app
ENV PORT=1323
ENTRYPOINT [ "/app" ]
CMD [ "./main" ]