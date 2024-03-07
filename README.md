# [gotemplate] Application

The [gotemplate] Application is a GoLang service designed to run as a background service, interacting with a PostgreSQL database to manage and store data. This README outlines the commands available for building, running, and managing both the application and its database.

## Prerequisites

- Docker and Docker Compose
- GoLang environment and make (for local development)
- PostgreSQL client tools (optional, for direct database access)
- dotenv for running out of docker with make (optional)

## Setup

Before running the application, ensure all dependencies are installed:


```bash
make install
```

This command initializes the Go module and updates dependencies, preparing your development environment.

## Building the Application

To build the application binary:

```bash
make build
```
This compiles the Go application and places the binary in the `./bin` directory.

## Set Up Environment Variables

First, copy the example environment file to create your own .env file:

```bash
cp env.example .env
```

Next, configure the variables in the `.env` file according to your setup.

## Running the Application

To run the compiled application:

```bash
make run
```
This command builds (if necessary) and runs the application binary.

## Managing the Database with Docker Compose

### Starting the Database
To start the PostgreSQL database in a Docker container:

```bash
make db-up
```
This command uses Docker Compose to start a PostgreSQL instance as specified in `docker-compose.yml`.

### Stopping the Database
To stop and remove the PostgreSQL container:

```bash
make db-down
```


## Building and Running with Docker

### Building the Docker Image
To build a Docker image for the application:

```bash
make docker-build
```
This builds the Docker image tagged as `gas-meter`, following the instructions in the `Dockerfile`.

### Running the Application in Docker
To run the application using Docker Compose:

```bash
make docker-run
```
This command builds the Docker image (if not up-to-date) and starts both the application and PostgreSQL database as defined in `docker-compose.yml`. The application is accessible at `http://localhost:8080`.

## Cleaning Up

To remove build artifacts and clean up the development environment:

```bash
make clean
```
This removes the `./bin` directory and its contents.

## Direct Database Access

If you need to access the PostgreSQL database directly, use the `psql` command-line tool or any PostgreSQL client, connecting with the credentials defined in your `.env` file and `docker-compose.yml`.

## Script Execution Guide

This project may include scripts designed for testing and engaging with its modules and dependencies. To run the example script, or any future scripts added, please use the following command as a guide:
For example
```bash
go run cmd/scripts/script.go
```