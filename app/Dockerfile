FROM golang:1.14-alpine as build

RUN apk update && apk add git

RUN mkdir -p /go/src/github.com/blacknikka/eks-log
WORKDIR /go/src/github.com/blacknikka/eks-log

COPY ./src /go/src/github.com/blacknikka/eks-log
RUN go get
RUN go build -o main

RUN chmod +x /go/src/github.com/blacknikka/eks-log/main

EXPOSE 8080

CMD [ "/go/src/github.com/blacknikka/eks-log/main" ]
