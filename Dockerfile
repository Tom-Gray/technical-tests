#label the build stage so we can reference it later
FROM golang:alpine as build

ENV GO111MODULE=on

WORKDIR /app

ADD ./ /app

#reduce number of layers by combining RUN commands
RUN apk update --no-cache && \
    apk add git && \
    go build -o golang-test  .

#create a new stage for running the app
FROM golang:alpine

#copy the combiled app from the build stage
COPY --from=build  /app/golang-test /app/

#reposition this command to be before the ENTRYPOINT
EXPOSE 8000

ENTRYPOINT ["/app/golang-test"]

