# Use the official Payara Server Full image as the base image
FROM payara/server-full

# Install mysql client and telnet
USER root
RUN apt-get update \
    && apt-get install -y mysql-client telnet \
    && rm -rf /var/lib/apt/lists/*
USER payara

# Copy the WAR file to the deployments directory in Payara
COPY ./jakartaee-rest/target/jakartaee-rest.war /opt/payara/deployments/

# Copy the post boot commands to configure the datasource
COPY ./jakartaee-rest/payara/post-boot-commands.asadmin /opt/payara/config/post-boot-commands.asadmin

# Ensure the post boot commands run on startup
ENTRYPOINT ["/bin/sh", "-c", "/opt/payara/appserver/bin/asadmin start-domain -v && /opt/payara/appserver/bin/asadmin --user admin --passwordfile=/opt/payara/passwordFile multimode --file /opt/payara/config/post-boot-commands.asadmin && /bin/bash /opt/payara/scripts/startInForeground.sh"]
