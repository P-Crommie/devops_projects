#!/bin/sh

check_mysql_connection() {
    mysqladmin -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" processlist > /dev/null 2>&1
    return $?
}

max_retries=11
retries=1
delay=5

while ! check_mysql_connection; do
    if [ "$retries" -eq "$max_retries" ]; then
        echo "Failed to connect after $(expr "$max_retries" - 1) attempts. Exiting..."
        exit 1
    fi

    echo "Connecting to $DB_HOST database... (Attempt: $retries)"
    sleep "$delay"

    retries=$(expr "$retries" + 1)
done

echo "Database is up, running, and healthy..."

java -Ddatasource.dialect="${DB_DIALECT}" \
    -Ddatasource.url="${DB_URL}" \
    -Ddatasource.username="${DB_USER}" \
    -Ddatasource.password="${DB_PASS}" \
    -Dspring.profiles.active="${SPRING_PROFILE}" \
    -jar /usr/src/lavagna/lavagna-jetty-console.war --headless