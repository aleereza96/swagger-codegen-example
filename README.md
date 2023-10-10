# Node server code generator from swagger

This project uses Docker, Docker Compose, and Swagger to create a Node.js/Express.js backend server. Below are some instructions and explanations to help you understand each piece of the puzzle.

## Table of Contents
- [Getting Started](#getting-started)
- [Dockerfile Explained](#dockerfile-explained)
- [Docker Compose](#docker-compose)
- [Swagger](#swagger)
- [Generate Server Code](#generate-server-code)
- [Running Swagger UI](#running-swagger-ui)

---

## Getting Started

To get started, make sure you have Docker and Docker Compose installed. If you don't, follow the installation guides for [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

---

## Dockerfile Explained

The Dockerfile sets up an image based on OpenJDK 11 and downloads the Swagger Codegen CLI. The CLI is used to generate the server code.


Here's what each section does:
- `FROM openjdk:11`: Use OpenJDK 11 as the base image.
- `ENV SWAGGER_CODEGEN_CLI ...`: Set environment variables for Swagger Codegen.
- `RUN curl ...`: Download Swagger Codegen CLI jar file.
- `WORKDIR ...`: Set working directories for Swagger definition and generated code.
- `COPY ...`: Copy your Swagger definition (`swagger.json`) into the image.
- `CMD ...`: Run Swagger Codegen CLI to generate Node.js/Express.js server code when the container starts.

---

## Docker Compose

The `docker-compose.yml` file helps you to define and run multi-container Docker applications. In our case, it's just one service that builds using the provided Dockerfile.

- `version: '3'`: Specifies the Docker Compose file version.
- `services`: List of all services that make up the project.
- `build: .`: Specifies the build context path.
- `volumes`: Binds the generated code to a local folder.

---

## Swagger

The `swagger.json` file is your API definition written in OpenAPI 3.0. This file is used by Swagger Codegen to generate server-side code.


---

## Generate Server Code

To generate the server code, run:

```bash
docker-compose up --build
```

This will build the Docker image and run the container, triggering the Swagger Codegen process.

---

## Running Swagger UI

To check out the Swagger UI, you'll need to run a separate service that serves the Swagger HTML and interacts with your API.

1. Get a Swagger UI Docker image: `docker pull swaggerapi/swagger-ui`
2. Run it and point it to your Swagger JSON: `docker run -p 8080:8080 -e SWAGGER_JSON=/path/to/swagger.json swaggerapi/swagger-ui`
