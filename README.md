# NGINX Gateway Service

This service provides routing and orchestration for API microservices.

## Setup and Installation

### Clone repo and submodules

```
git clone git@github.com:walterscarborough/docker-nginx-gateway.git
```

### Building the docker container

```
cd docker-nginx-gateway

docker build -t nginx-gateway .
```

### Running the docker container

```
docker run -it nginx-gateway
```
