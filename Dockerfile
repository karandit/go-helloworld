FROM golang:1.14.4-buster as compiler 
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 go build -a -ldflags '-s' .

FROM scratch 
COPY --from=compiler /app/go-helloworld . 
EXPOSE 8080
CMD ["./go-helloworld"]
