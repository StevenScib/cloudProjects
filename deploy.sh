#!/bin/bash
# Check if there is instance running with the image name we are deploying
CURRENT_INSTANCE=$(sudo docker ps -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")

# If an instance does exist, then stop and remove it
if [ "$CURRENT_INSTANCE" ]; then
    sudo docker rm $(sudo docker stop $CURRENT_INSTANCE)
fi

# Pull down the instance from Docker Hub
sudo docker pull $IMAGE_NAME

# Check if a docker container exists with the name of $CONTAINER_NAME; if it does, remove the container
CONTAINER_EXISTS=$(sudo docker ps -a | grep $CONTAINER_NAME)
if [ "$CONTAINER_EXISTS" ]; then
    sudo docker rm $CONTAINER_NAME
fi

#    Run the new container
sudo docker run -p 3000:3000 -d --name $CONTAINER_NAME $IMAGE_NAME
