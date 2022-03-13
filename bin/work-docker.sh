#!/bin/sh

API_FOLDER=/mnt/data/ccare/Communicare.Api

if [ $# -ne 1 ]
then
	echo "Usage: $0 <start|stop>"
	exit
fi

export COMPOSE_PARALLEL_LIMIT=10
cd $API_FOLDER

if [ "$1" = "start" ]
then
    git pull
    cd ./docker-dev
    docker-compose down
    cd ../docker-infrastructure
    docker-compose down
    cd ../docker-admin
    docker-compose down
    docker-compose pull
    docker-compose up -d
    cd ../docker-infrastructure
    docker-compose pull
    docker-compose up -d
    cd ../docker-dev
    docker-compose pull
    docker-compose up -d
elif [ "$1" = "stop" ]
then
    cd ./docker-dev
    docker-compose down
    cd ../docker-infrastructure
    docker-compose down
    cd ../docker-admin
    docker-compose down
else
    echo "Usage: $0 <start|stop>"
fi
		
