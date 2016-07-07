#use the golang base image
FROM golang:1.6
MAINTAINER Daniel van Gils

#gat all the go testing stuff
RUN go get github.com/gin-gonic/gin

#switch to our app directory
RUN mkdir -p /app
WORKDIR /app

#copy the source files
ADD . /app

ENV GIN_MODE=release
ENV CGO_ENABLED=0 
ENV GOOS=linux

RUN go build -a -installsuffix cgo -o server
ENV GIN_MODE=release
CMD /app/server