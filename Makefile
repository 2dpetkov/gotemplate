.PHONY: install build run db-up db-down docker-build docker-run clean

# Initialize the Go module and update dependencies
install:
	@echo "Checking Go module initialization..."
	@if [ ! -f go.mod ]; then \
		echo "Initializing Go module"; \
		go mod init gotemplate; \
	fi
	@echo "Updating dependencies..."
	@go get -u ./...

# Build the Go application
build:
	@echo "Building the Go application..."
	@go build -o ./bin/gotemplate ./cmd/gotemplate/

# Run the application
run: build
	@echo "Running the application..."
	@dotenv -f .env ./bin/gotemplate

# Start the PostgreSQL database using Docker Compose
db-up:
	@echo "Starting PostgreSQL container..."
	@docker-compose up -d db

# Stop and remove the PostgreSQL container
db-down:
	@echo "Stopping PostgreSQL container..."
	@docker-compose down

# Build and run the application using Docker
docker-build:
	@echo "Building Docker image..."
	@docker build -t gotemplate .

docker-run: docker-build
	@echo "Running Docker container..."
	@docker-compose up app

# Clean build artifacts
clean:
	@echo "Cleaning up..."
	@rm -rf ./bin
