# Use an official Go runtime as a parent image for the build stage
FROM golang:1.21 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the entire project
COPY . .

# Use Makefile to initialize Go module and update dependencies
RUN make install

# Use Makefile to build the application
RUN make build

# Start a new stage from scratch to create a smaller final image
# Change this from alpine:latest to ubuntu:latest
FROM ubuntu:latest

# Install ca-certificates for SSL verification if your application needs it
# Adjust package installation for Ubuntu
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/bin/gotemplate .

# Command to run the executable
CMD ["./gotemplate"]
