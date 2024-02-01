FROM golang:bullseye as builder
WORKDIR /app
RUN apt update && apt install -y git && apt clean
RUN git clone https://github.com/vikyd/go-cpu-load.git
WORKDIR /app/go-cpu-load
# Build arm64
RUN GOOS=linux GOARCH=arm64 go build -o go-cpu-load


FROM nginx
RUN apt update && apt install -y stress && apt clean
COPY --from=builder /app/go-cpu-load/go-cpu-load /usr/local/bin/go-cpu-load
RUN chmod +x /usr/local/bin/go-cpu-load
