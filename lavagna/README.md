# Lavagna

Lavagna DevOps project, consists of a three-tier web application deployed using Docker Compose. The project utilizes a Java-based application, MySQL as the database, and Nginx as a reverse proxy for serving static frontend files. The project is based on the [Lavagna](http://lavagna.io/) issue/project tracking software. The application has been containerized using a multistage build and can be brought up easily using Docker Compose.

## Authors

[Emmanuel Cromwell](https://github.com/blacrommie)

## Project Structure

```bash
.
├── docker-compose.yml
├── dockerfile
├── documentation
│   └── nginx.conf
├── entrypoint.sh
├── nginx.conf
└── project
    ├── CHANGELOG.md
    ├── demo.Dockerfile
    ├── generate-material.js
    ├── help
    ├── LICENSE-GPLv3.txt
    ├── misc
    ├── package.json
    ├── pom.xml
    ├── puppet
    ├── README_EXECUTABLE_WAR.txt
    ├── README.md
    ├── ROADMAP.md
    ├── src
    └── Vagrantfile
```

# Components

## Dockerfile

The Dockerfile defines the build steps and runtime environment for the Lavagna application. It consists of two stages: `builder` and `runner`. The `builder` stage uses a Maven image to build the application, while the `runner` stage uses an OpenJDK image as the base for running the application.

## Entrypoint Script

The entrypoint script is used to ensure that the database is up and running before starting the Lavagna application. It also sets the necessary environment variables for the application.

## Nginx Configuration

The project includes two Nginx configurations:

* `nginx.conf`: This configuration file is used by the Nginx reverse proxy to route requests to the Lavagna application running on port 8080. It also serves static frontend files and handles proxying of requests.
* `documentation/nginx.conf`: This configuration file is used by the Nginx container serving the Lavagna documentation. It serves static HTML files and defines the server settings for the documentation service.

The Nginx configurations ensure proper routing and serving of the Lavagna application and documentation.

## Docker Compose

The Docker Compose file (`docker-compose.yml`) defines the services, networks, and volumes required for the project. It orchestrates the deployment of the Lavagna application, MySQL database, Nginx reverse proxy, and documentation service. The file also specifies the environment variables and dependencies between the services.

# Getting Started

To get started with the Lavagna DevOps project, follow the steps below:

### Prerequisites

Make sure you have the following prerequisites installed on your system:

* Docker: [Install Docker](https://docs.docker.com/get-docker/)
* Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

### Clone the Repository

Clone the Lavagna DevOps project repository to your local machine:

```bash
git clone <repository_url>
cd lavagna
```

## Configure Environment Variables

Before running the project, you need to configure the necessary environment variables. Open the `.env` file and set the values according to your preferences:

```dotenv
MYSQL_ROOT_PASSWORD=<root_password>
MYSQL_DATABASE=<database_name>
MYSQL_USER=`<username>`
MYSQL_PASSWORD=`<password>`
DB_PASS=<database_password>
DB_URL=jdbc:mysql://lavagna-db:3306/lavagna?autoReconnect=true&useSSL=false
```

## Build and Run the Project

1. Build the Docker images and start the containers using Docker Compose:

```bash
docker-compose up -d
```

2. Wait for the containers to start and initialize. This may take a few moments. Once the containers are up and running, you can access the Lavagna application by opening your web browser and navigating to http://localhost. The Lavagna issue/project tracking software should be available.
3. To access the Lavagna documentation, visit http://localhost:8081 in your web browser.
