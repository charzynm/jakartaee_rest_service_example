# Use the official Payara Server Full image as the base image
FROM payara/server-full

# Install mysql client
USER root
RUN apt-get update \
    && apt-get install -y mysql-client \
    && apt-get install -y telnet \
    && rm -rf /var/lib/apt/lists/*
USER payara
# Copy the WAR file to the deployments directory in Payara
COPY ./jakartaee-rest/target/jakartaee-rest.war /opt/payara/deployments/

# Copy the post boot commands to configure the datasource
COPY ./jakartaee-rest/payara/post-boot-commands.asadmin /opt/payara/config/post-boot-commands.asadmin
