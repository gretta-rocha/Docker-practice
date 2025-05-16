# 🐳 Simple Node.js API in Docker

This project provides a minimal API built with Node.js, containerized using a **multi-stage Docker build**. It exposes a single endpoint `/info` that returns:

- The container's hostname
- The container's IP address

# Simple Node.js API – Docker Instructions

## Docker Build Command

To build the Docker image using the Dockerfile in this project:

```bash
docker build -t backend .
```

- `docker build`: Builds a Docker image.
- `-t backend`: Tags the image with the name `backend`.
- `.`: Specifies the current directory as the build context (where the Dockerfile is located).

## Docker Run Command

To run the container from the built image:

```bash
docker run -d --name mybackend backend
```

- `docker run`: Starts a new container.
- `-d`: Runs the container in detached mode (in the background).
- `--name mybackend`: Assigns the name `mybackend` to the container.
- `backend`: The name of the image to run.

This runs the API without exposing it to the host.

To test the API from inside the container:

```bash
docker exec -it mybackend curl http://localhost:3000/info
```
