# jakartaee_rest_service_example
mvn archetype:generate -DgroupId=com.example -DartifactId=jakartaee-rest -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

# payara docker image
docker pull payara/server-full

docker run -p 8080:8080 payara/server-full
docker run -p 8080:8080 -v ~/target/jakartaee-rest.war:/opt/payara/deployments payara/server-full

docker build -t jakartaee-rest:1.0 .
docker run -p 8080:8080 jakartaee-rest:1.0
