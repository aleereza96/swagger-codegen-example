# Use an image that has Java installed
FROM openjdk:11

# Environment variables for Swagger Codegen CLI
ENV SWAGGER_CODEGEN_CLI https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.29/swagger-codegen-cli-3.0.29.jar
ENV CODEGEN_CLI_JAR /usr/local/bin/swagger-codegen-cli.jar

# Download Swagger Codegen CLI
RUN curl -L $SWAGGER_CODEGEN_CLI -o $CODEGEN_CLI_JAR

# Create a directory for the Swagger definition
WORKDIR /usr/src/swagger

# Copy the Swagger definition into the Docker image
COPY ./swagger/swagger.json .

# Create a directory for the generated code
WORKDIR /usr/src/generated

# Run Swagger Codegen to generate Node.js/Express.js server code
CMD java -jar $CODEGEN_CLI_JAR generate -i /usr/src/swagger/swagger.json -l nodejs-server -o /usr/src/generated
