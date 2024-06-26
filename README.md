# jakartaee_rest_service_example
mvn archetype:generate -DgroupId=com.example -DartifactId=jakartaee-rest -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

# payara docker image
docker pull payara/server-full

docker container ls
docker stop <container-name>

docker-compose up --build
docker-compose up -d


docker logs -f payara
docker logs -f mysql

# db
sudo apt-get update
sudo apt-get install mysql-client

mysql -u yourUsername -pyourPassword -h localhost books_db

-- get container id
docker ps
-- connect 
docker exec -it 46fcb238d360 mysql -u yourUsername -pyourPassword -h localhost books_db

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
# jdbc
docker exec -it 6d8a7fee67bf /bin/bash
cd /opt/payara/appserver/glassfish/domains/domain1/config
grep -A 10 -B 10 '<jdbc-connection-pool' domain.xml
exit
# ping jdbc connection pool
docker exec -it 68694bcd0aa5 /bin/bash
/opt/payara/appserver/bin/asadmin ping-connection-pool BookPool
# telnet
telnet mysql 3306
# app deployment
docker exec -it 6d8a7fee67bf /bin/bash
cd /opt/payara/appserver/glassfish/domains/domain1/config
grep -A 10 -B 10 '<applications>' domain.xml
exit
# manual deployment
docker exec -it 5fd822585797 /bin/bash
mkdir -p /opt/payara/applications
exit
docker cp ./jakartaee-rest/target/jakartaee-rest.war 6d8a7fee67bf:/opt/payara/applications/
docker exec -it 6d8a7fee67bf /bin/bash
/opt/payara/appserver/bin/asadmin deploy /opt/payara/applications/jakartaee-rest.war
/opt/payara/appserver/bin/asadmin list-applications
exit
# server.log
docker exec -it 6d8a7fee67bf /bin/bash
cat /opt/payara/appserver/glassfish/domains/domain1/logs/server.log
exit

docker exec payara mysql -h mysql -u yourUsername -pyourPassword -e "SHOW DATABASES;"
