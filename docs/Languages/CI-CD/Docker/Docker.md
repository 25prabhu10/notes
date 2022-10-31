---
title: Docker
description: Docker is a set of platform as a service (PaaS) products that use OS-level virtualisation to deliver software in packages called containers
---

# Docker

Docker is a set of platform as a service (PaaS) products that use OS-level virtualisation to deliver software in packages called [containers](#container)

_Example:_

```bash
# pull a docker image
docker pull alpine

# run a new container from the image
docker run -t -d --name <customName> alpine

# check currently running Docker containers
docker ps

# connect to a container
docker exec -it <customName> bash

# stop a container
docker stop <customName>

# check container stats
docker stats
```

## Container

A way to **package application** with **all** the **necessary dependencies** and **configuration**

- Portable artifact, easily shared and moved around.

Need of containers:

- Compatibility / Dependency
- Long setup time
- Different Dev/Test/Prod environments

## `Dockerfile`

Each step is considered as a layer of an image

- Docker caches results layer by layer

```bash
docker build .

docker build -t <image-name>:<version> .

docker image ls

docker image rm <image-id>
docker rmi -f <image-id>

docker run -p 8080:3000 -d --name <container-name> <image-name>

docker run -it express

# enter the container
docker exec -it express bash

# delete container
docker rm <container-name> -f
```

`Dockerfile` statements:

| Command      | Purpose                                                                                                                                         |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `FROM`       | To specify the parent image                                                                                                                     |
| `WORKDIR`    | To set the working directory for any commands that follow in the `Dockerfile`                                                                   |
| `RUN`        | To install any applications and packages required for your container                                                                            |
| `COPY`       | To copy over files or directories from a specific location                                                                                      |
| `ADD`        | As `COPY`, but also able to handle remote URLs and unpack compressed files                                                                      |
| `ENTRYPOINT` | Command that will always be executed when the container starts. If not specified, the default is `/bin/sh -c`                                   |
| `CMD`        | Arguments passed to the entrypoint. If `ENTRYPOINT` is not set (defaults to `/bin/sh -c`) the `CMD` will be the commands the container executes |
| `EXPOSE`     | To define which port through which to access your container application                                                                         |
| `LABEL`      | To add metadata to the image                                                                                                                    |

_Example:_

- From scratch:

  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM scratch
  COPY helloworld /
  CMD ["/helloworld"]
  ```

- Python app:

  ```dockerfile
  # Docker image
  FROM python:latest

  # Set the working directory
  WORKDIR /app

  # Install dependencies
  COPY ./requirements.txt /app
  RUN pip install --no-cache-dir --upgrade -r requirements.txt

  # Copy the scripts to the folder
  COPY . /app

  # Start the app
  CMD ["python main.py"]
  ```

`.dockerignore` file is used to prevent sensitive or unnecessary files and directories from making their way into your image builds

- It should be in the root directory, known as the build **context**

- [ASP.NET Core app](../../C-Sharp/ASP_NET/Deployment.md#deploying-with-docker)

## Reference

- Learning Docker by Arthur Ulfeldt
- Docker for .NET Developers with Visual Studio by Lee Brandt
