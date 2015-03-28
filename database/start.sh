#!/bin/bash -e

echo "Launching database" | tee db.log

if [ -f db.cid ]; then
 ./stop.sh
fi

docker build -t conjurdemos/sentry-db . 2>&1 >> db.log
docker run -d --cidfile=db.cid --name=sentry-db conjurdemos/sentry-db 2>&1 >> db.log

sleep 10

docker logs sentry-db >> db.log

password=$(openssl rand -hex 8)
docker exec sentry-db mysql -e 'set password for "sentry"=password("'${password}'");' 2>&1 >> db.log
export DB_PASSWORD=${password}

mysql_host=$(docker inspect sentry-db | grep IPAddress | cut -d '"' -f 4)

export DB_HOST=${mysql_host}

echo 'Database launched! Check $DB_HOST and $DB_PASSWORD'
