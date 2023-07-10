# Cowsay

Cowsay is a program that generates ASCII pictures of a cow with Dupak Chopra quotes. This project is a Dockerized version of Cowsay, allowing you to easily run and deploy Cowsay as a containerized application.

## Authors

[Emmanuel Cromwell](https://github.com/blacrommie)

## Project Structure

```bash
├── dockerfile
├── entry-point.sh
└── src
    ├── index.js
    ├── package.json
    ├── package-lock.json
    ├── public
    │   ├── cow.png
    │   └── favicon.ico
    └── README.md
```

The `dockerfile` contains the instructions for building the Docker image. It starts with the `node:19-alpine3.16` base image, sets the working directory to `/usr/src/cowsay`, and copies the `package.json` and `package-lock.json` files to the working directory. It then sets up a cache for npm dependencies, installs the required packages, and copies the source code to the image. Finally, it copies the `entry-point.sh` script to `/usr/local/bin` and sets it as the entry point for the container.

The `entry-point.sh` script is responsible for executing the necessary commands or starting the Cowsay application when the Docker container is run. It is made executable and assigned as the entry point in the Dockerfile.

The script checks if a port argument is provided when running the Docker container. If no port is specified, it defaults to port 8080. The script then exports the `PORT` environment variable with the chosen port value and proceeds to start the Cowsay application by running `npm start`.

With this setup, the Cowsay application will be accessible at the specified port within the Docker container.

# Installation

To build and run the Docker container, follow these steps:

1. Install Docker on your system if you haven't already.
2. Clone the project repository.
3. Open a terminal and navigate to the project directory.

# Getting Started

To build the Docker image and run the container, use the following commands:

```bash
docker build -t cowsay .
docker run -dp `<host-port>`:`<container-port>` cowsay `<port>`
```

Replace `<host-port>` with the desired port number on the host machine and `<container-port>` with the corresponding port number within the container. Replace `<port>` with the preferred port for the Cowsay application.

Example:

```bash
docker run -dp 8080:8080 cowsay 8080
```

This will build the Docker image and run a container based on it, mapping port 8080 from the host machine to port 8080 within the container. The Cowsay application will be accessible at http://localhost:8080.

Feel free to customize the port numbers according to your needs.
