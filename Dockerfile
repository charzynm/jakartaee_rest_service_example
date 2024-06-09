# Use the official Payara Server Full image as the base image
FROM payara/server-full

# Copy the WAR file to the deployments directory in Payara
COPY jakartaee-rest/target/jakartaee-rest.war $PAYARA_DIR/deployments/

# Copy the post boot commands to configure the datasource
COPY payara/post-boot-commands.asadmin $PAYARA_DIR/config/post-boot-commands.asadmin
