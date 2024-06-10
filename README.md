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
docker exec -it 552e6b4b5b0d mysql -u yourUsername -pyourPassword -h localhost books_db

docker exec -it 552e6b4b5b0d ls /docker-entrypoint-initdb.d/
docker exec -it 552e6b4b5b0d cat /docker-entrypoint-initdb.d/init.sql

-- initialize manually
docker exec -it 552e6b4b5b0d bash 
mysql -u root -p < /docker-entrypoint-initdb.d/init.sql

SHOW DATABASES;
USE books_db;
SHOW TABLES;

# webapp - check domain.xml
curl http://localhost:8080/jakartaee-rest
docker exec -it 6d8a7fee67bf /bin/bash
cd /opt/payara/appserver/glassfish/domains/domain1/config
grep -A 10 -B 10 '<jdbc-connection-pool' domain.xml
exit