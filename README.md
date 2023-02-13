# jenkins-practice
Jenkins docker container on VM with practice ...

# Installation
## Setup vagrant and VM
```
# vagrant must be installed
vagrant up
vagrant ssh
cd /vagrant
```
## Build the Jenkins Docker Image
```
sudo docker build -t myjenkins:1.0 .
```

## Create the network 'jenkins'
```
sudo docker network create jenkins
```

## Run the Container
### MacOS / Linux
```
sudo docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins:1.0
```

### Windows
```
docker run --name jenkins-blueocean --restart=on-failure --detach `
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 `
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 `
  --volume jenkins-data:/var/jenkins_home `
  --volume jenkins-docker-certs:/certs/client:ro `
  --publish 8080:8080 --publish 50000:50000 myjenkins:1.0
```


## Get the Password
```
sudo docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
```

## Connect to the Jenkins form host
```
http://localhost:8080/
```

## Installation Reference:
https://www.jenkins.io/doc/book/installing/docker/

# UP another container for docker cloud
## alpine/socat container to forward traffic from Jenkins to Docker Desktop on Host Machine

https://stackoverflow.com/questions/47709208/how-to-find-docker-host-uri-to-be-used-in-jenkins-docker-plugin
```
sudo docker run -d --restart=always -p 127.0.0.1:2376:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock
sudo docker inspect <container_id> | grep IPAddress
```
