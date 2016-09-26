# Cloudfoundry UAA in docker
CloudFoundry User Account and Authentication (UAA) Server packed in a docker container.
I often use this authorization server implementation as the help in developing security layer in my projects.

## Building image
Building docker image that contains environment for compilation.:
```
docker build -t uaa_build:1.0 -f build/Dockerfile .
docker run --rm --volume="$PWD/target:/target" uaa_build:1.0
```
Prepare final docker image with UAA server.:
```
docker build -t uaa:1.0 -f assemble/Dockerfile .
```

## Runing 
You can run uaa in docker using one of bellow showed commands
```
docker run -t -d -p 8080:8080 --name "uaa" uaa:1.0
```

or if you want to create local net to simulate real networking
```
docker network create --subnet=172.18.0.0/16 poligonnet
docker run --net=poligonnet --ip 172.18.0.5 --dns=172.17.0.1 -h uaa.localnet --name "uaa" -p 8080:8080 -d uaa:1.0 
```
You can expose uaa configuration via UAA_CONFIG_PATH environment variable
```
docker run --net=poligonnet --volume="$PWD/tmp/uaa.yml:/tmp/uaa.yml" -e UAA_CONFIG_PATH=/tmp --ip 172.18.0.5 --dns=172.17.0.1 -h uaa.localnet --name "uaa" -p 8080:8080 -d uaa:1.0
docker run --net=poligonnet --volume="$PWD/tmp/uaa.yml:/tmp/uaa.yml" --volume="$PWD/tomcatconfig/server.xml:/root/apache-tomcat-7.0.55/conf/server.xml" --volume="$PWD/logs:/root/apache-tomcat-7.0.55/logs" -e UAA_CONFIG_PATH=/tmp --ip 172.18.0.5 --dns=172.17.0.1 -h uaa.localnet --name "uaa" -p 8080:8080 -d uaa:1.0
```

## Using uaa (password for admin user: admin)
```
uaac target http://uaa.localnet:8080
uaac token get admin
uaac user add jojo --emails jojo@jojo.org
```
