FROM golang:1.24.1 as stage1

# set the working directory
WORKDIR /app 

# copy the source files
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o meuExecutavel ./cmd

EXPOSE 8080

FROM scratch

COPY --from=stage1 /app/meuExecutavel /

ENTRYPOINT [ "/meuExecutavel" ]