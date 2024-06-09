# Use the official Payara Server Full image as the base image
FROM payara/server-full

# Copy the WAR file to the deployments directory in Payara
COPY ./jakartaee-rest/target/jakartaee-rest.war /opt/payara/deployments/

# Copy the post boot commands to configure the datasource
COPY jakartaee-rest/payara/post-boot-commands.asadmin /opt/payara/config/post-boot-commands.asadmin
