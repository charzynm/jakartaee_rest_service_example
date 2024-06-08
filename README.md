# jakartaee_rest_service_example
mvn archetype:generate -DgroupId=com.example -DartifactId=jakartaee-rest -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

# payara docker image
docker pull payara/server-full

docker build -t my-image .
docker run -p 8080:8080 my-image

docker container ls
docker stop <container-name>