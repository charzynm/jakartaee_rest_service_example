FROM payara/server-full:6.2024.5-jdk17

# Install wget if not already installed
RUN apt-get update && apt-get install -y wget

# Set the working directory
WORKDIR /workspace

# Copy the current directory contents into the container
COPY . .

# Ensure maven dependencies are downloaded
RUN mvn dependency:resolve

# Expose the default Payara Micro port
EXPOSE 8080
