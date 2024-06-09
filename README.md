# jakartaee_rest_service_example
mvn archetype:generate -DgroupId=com.example -DartifactId=jakartaee-rest -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

# payara docker image
docker pull payara/server-full

docker build -t my-image .
docker run -p 8080:8080 my-image

docker container ls
docker stop <container-name>

docker-compose up --build

docker logs -f payara
docker logs -f mysql

# db
sudo apt-get update
sudo apt-get install mysql-client

mysql -u yourUsername -pyourPassword -h localhost books_db

-- get container id
docker ps
-- connect 
docker exec -it c9a89a8c5912 mysql -u yourUsername -pyourPassword -h localhost books_db

SHOW DATABASES;
