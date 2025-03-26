FROM golang:1.24.1

# set the working directory
WORKDIR /go/src/app 

# copy the source files
COPY . .

# EXPOSE the port
EXPOSE 8080

# build the Go app
RUN go build -o main cmd/main.go

# run the executable
CMD ["./main"]