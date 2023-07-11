#!/bin/sh

mysqladmin -h $DB_HOST -u$DB_USER -p$DB_PASS processlist &2> /dev/null
while [ $? -ne 0 ] ;do
    echo "Connecting to $DB_HOST database..."
    mysqladmin -h $DB_HOST -u$DB_USER -p$DB_PASS processlist &2> /dev/null
done

echo "Database up, running and healthy..."

java -Ddatasource.dialect="${DB_DIALECT}" \
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar /usr/src/lavagna/lavagna-jetty-console.war --headless