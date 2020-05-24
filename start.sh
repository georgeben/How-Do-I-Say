#!/bin/sh
echo "Building image"
docker build -t how-do-i-say .
echo "Finished building image"

echo "Starting container"
docker run --rm -p:8080:80 -it how-do-i-say
