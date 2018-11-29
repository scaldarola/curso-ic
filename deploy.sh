docker stop curso
docker rm curso
docker run --name curso -e --link sql-server:sql-server JAVA_OPTS="-Dspring.profiles.active=ic" -p 8080:8080 -d curso-ic:0.0.1-SNAPSHOT