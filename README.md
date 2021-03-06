# docker cheat sheet (swarm, stack, service, compose)  :penguin: :metal:

## build
```
docker build -t <image> .       # Create image using this directory's Dockerfile
```
## run
```
docker run -p 4000:80 <image>      # Run "friendlyhello" mapping port 4000 to 80
docker run -d -p 4000:80 <image>              # Same thing, but in detached mode
```

## container
```
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container ls -q                          # list all running container ids
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
```

## image
```
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
```
## tag
```
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry
```
## registry
```
docker login             # Log in this CLI session using your Docker credentials
```
## swarm
```
docker swarm init --advertise-addr <HOST IP>         #create a swarm on the host
docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker stack ps <service>                               # display cluster detail
docker service ls                 # List running services associated with an app
docker stacke services <service>               # dicplays your cluster info
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application
docker swarm leave --force      # Take down a single node swarm from the manager
```
## compose
```
docker-compose start                    start from local docker-compose.yml file
docker-compose stop                     stop from loccal docker-compose.yml file
docker-compose pause                  freeze all container from any socket event
docker-compose unpause                                     restore socket events
docker-compose ps                                list current running containers
docker-compose up              update containers from docker-compose.yml changes
docker-compose down                gracefully shutdown containers (keep volumes)
docker-compose up --remove-orphans                    remove orphaned containers
```
## prune
```
docker volume prune                                         # remove all vomumes
docker system prune                  # shudown containers and erase local images
docker network prune                        # down and errase the network bridge
```
