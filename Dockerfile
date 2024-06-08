FROM mcr.microsoft.com/devcontainers/java:17

# Install wget if not already installed
RUN apt-get update && apt-get install -y wget

# Download Payara Micro
RUN wget https://repo1.maven.org/maven2/fish/payara/distributions/payara-micro/6.2023.2/payara-micro-6.2023.2.jar -O /usr/local/bin/payara-micro.jar

# Set the working directory
WORKDIR /workspace

# Copy the current directory contents into the container
COPY . .

# Ensure maven dependencies are downloaded
RUN mvn dependency:resolve

# Expose the default Payara Micro port
EXPOSE 8080
