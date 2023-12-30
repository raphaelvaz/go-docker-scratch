FROM golang:alpine3.19 as golang
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /server .

FROM scratch
COPY --from=golang /server .
CMD [ "/server" ]