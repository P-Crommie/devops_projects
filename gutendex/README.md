# Gutendex

Gutendex is a Dockerized application that builds a searchable index of books from Project Gutenberg, a public store of books in the public domain. It allows users to search for books based on title, author, and other criteria. The project utilizes a three-tier architecture, leveraging Docker Compose to manage the service topology.

## Technology Stack

The Gutendex project employs the following technologies:

* Postgres: A PostgreSQL database is used to store and manage the book index.
* Python & Django: Python and Django are used to create the book index and serve the files.
* Static HTML & JS: The frontend of Gutendex consists of static HTML and JavaScript files, providing a user-friendly interface for accessing the API.

## Project Structure

The project directory structure is organized as follows:

```bash
.
├── db_healthchecker.py
├── docker-compose.yml
├── dockerfile
├── entrypoint.sh
├── init.sql
├── nginx.conf
└── project
    ├── books
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── management
    │   ├── migrations
    │   ├── models.py
    │   ├── serializers.py
    │   ├── tests.py
    │   ├── utils.py
    │   └── views.py
    ├── catalog_files
    │   └── tmp
    ├── gutendex
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── templates
    │   ├── urls.py
    │   └── wsgi.py
    ├── installation-guide.md
    ├── license
    ├── manage.py
    ├── readme.md
    ├── requirements.txt
    └── static
        ├── robots.txt
        ├── scripts
        └── styles
```

The project directory contains various files and directories necessary for building and running Gutendex. The core components include docker-compose.yml, dockerfile, entrypoint.sh, init.sql, nginx.conf, db_healthchecker.py and the project directory containing the source code.

# Components

## Dockerfile

The `dockerfile` specifies the build steps and runtime environment for the Gutendex application. It starts with a Python 3.8 Alpine base image, installs dependencies, and copies the necessary files.

## Docker Compose

The `docker-compose.yml` file defines the service topology for the Gutendex project. It includes services for the Postgres database, Gutendex backend, and Nginx reverse proxy.

## Entrypoint Script

The `entrypoint.sh` script is the entry point for the Gutendex container. It performs tasks such as waiting for the PostgreSQL database to be available, migrating the database schema, and updating the book catalog. Finally, it runs the Gutendex server.

## Database Health Checker

The `db_healthchecker.py` script is responsible for checking the availability of the PostgreSQL database before starting the Gutendex application. It attempts to establish a connection with the database and waits until the connection is successful.

## Initialization SQL Script

The `init.sql` script grants all privileges on the `gutendex` database to the `gutendex` user. This script is executed when the PostgreSQL container initializes.

## Nginx Configuration

The `nginx.conf` file contains the Nginx server configuration for serving the static frontend files and acting as a reverse proxy for the Gutendex backend.

# Getting Started

To get started with Gutendex, follow these steps:

1. Clone the repository and navigate to the project directory:

```bash
git clone <repository_url>
cd Gutendex
```

NOTE: Ensure that Docker and Docker Compose are installed on your system.

2. Open the .env file and configure the environment variables according to your preferences. At a minimum, set the following variables:

```dotenv
POSTGRES_PASSWORD=<your_postgres_password>
POSTGRES_USER=<your_postgres_user>
POSTGRES_DB=<your_postgres_database>
GUTENDEX_PORT=<your_preferred_port>
DATABASE_HOST=db
DATABASE_PORT=5432
GUTENDEX_HOSTNAME=<your_gutendex_hostname>
```

3. Create a new .env file in the `gutendex` directory within the `project` directory.

```dotenv
ALLOWED_HOSTS=<127.0.0.1,localhost,.your.domain.here>
DATABASE_HOST=<127.0.0.1>
DATABASE_NAME=gutendex
DATABASE_PASSWORD=<a-long-string-of-random-characters>
DATABASE_PORT=5432
DATABASE_USER=gutendex
DEBUG=false
EMAIL_HOST=<your.smtp.host.here>
EMAIL_HOST_ADDRESS=<gutendex@your.domain.here>
EMAIL_HOST_PASSWORD=<your-smtp-host-password>
EMAIL_HOST_USER=<your-smtp-host-user-name>
MEDIA_ROOT=/var/www/gutendex/media/
SECRET_KEY=<another-long-string-of-random-characters>
STATIC_ROOT=/var/www/gutendex/static-root/
```

This .env file contains environment variables used by the Gutendex Django application. These values are placeholders and may need to be customized based on your environment.

4. Build and start the Gutendex containers using Docker Compose:

```bash
docker-compose up -d
```

5. Wait for the containers to start and the Gutendex application to be accessible.
6. Once the system is up and running, you can access the Gutendex API and UI by visiting http://localhost in your web browser.
7. To test the functionality of the Gutendex application, you can try searching for books using the API or exploring the UI. Use a tool like `curl` to send a request to `/books/?search=arthur%20conan%20doyle` and verify the response. The expected result should contain 14 books by Arthur Conan Doyle.

By following these steps, you should have Gutendex up and running on your local machine, allowing you to search and explore the vast collection of books from Project Gutenberg.
