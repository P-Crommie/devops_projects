# FoodTrucks

The Food Trucks project is a three-tier web application that enables users to explore information about food trucks in San Francisco. The application consists of the following components:

1. **Elasticsearch** : Data about food trucks in San Francisco is stored in Elasticsearch, which serves as the backend database. Elasticsearch provides powerful search and indexing capabilities, allowing efficient retrieval and querying of food truck data.
2. **Python/Flask** : The web application is built using the Python programming language and the Flask framework. Flask serves as the backend server, handling client requests, interacting with Elasticsearch to fetch food truck data, and providing the necessary APIs and endpoints for data retrieval and manipulation.
3. **React and Mapbox** : The frontend of the application is built with React, a popular JavaScript library for building user interfaces. The beautiful maps used in the application are courtesy of Mapbox, which provides interactive and visually appealing mapping functionalities. React components are used to render the frontend elements and interact with the backend APIs to display food truck information and enable user interaction.

## Project Structure

The project structure is as follows:

```bash
├── docker-compose.yml
├── dockerfile
├── nginx.conf
└── project
    ├── flask-app
    │   ├── app.py
    │   ├── package.json
    │   ├── package-lock.json
    │   ├── requirements.txt
    │   ├── static
    │   │   ├── build
    │   │   │   ├── main.js
    │   │   │   └── main.js.map
    │   │   ├── favicon.ico
    │   │   ├── icons
    │   │   ├── src
    │   │   │   ├── app.js
    │   │   │   └── components
    │   │   │       ├── Intro.js
    │   │   │       ├── Sidebar.js
    │   │   │       └── Vendor.js
    │   │   └── styles
    │   │       └── main.css
    │   ├── templates
    │   │   └── index.html
    │   └── webpack.config.js
    ├── README.md
    ├── shot.png
    └── utils
        ├── generate_geojson.py
        └── trucks.geojson
```

The main components of the project are as follows:

* `docker-compose.yml`: Contains the configuration for Docker Compose to run and manage the application's services.
* `dockerfile`: Defines the instructions for building the Docker image of the application.
* `nginx.conf`: The configuration file for the Nginx web server.
* `project/flask-app`: The directory containing the Flask backend application.

  * `app.py`: The main Flask application file.
  * `package.json` and `package-lock.json`: Files specifying the JavaScript dependencies for the React frontend.
  * `requirements.txt`: Specifies the Python dependencies for the Flask backend.
  * `static`: Directory containing static files for the frontend.
  * `templates`: Directory containing HTML templates used by Flask.
  * `webpack.config.js`: Configuration file for the Webpack build process.
* `project/utils`: Directory containing utility scripts for the project.

# Configs

## Dockerfile

The Dockerfile defines the instructions to build the Docker image for the application. The Dockerfile utilizes a multi-stage build approach, which consists of   **Builder Stage** and **Runner Stage**. The first stage, builder stage, sets up the build environment. It installs dependencies, such as Node.js and npm, and copies the Flask application source code to the working directory. The runner stage, sets up the runtime environment. It installs Python 2 and necessary development packages, upgrades pip and related tools, and copies the built Flask application.

By utilizing a multi-stage build in the Dockerfile, the Food Trucks application achieves several benefits. Firstly, it separates the build environment from the runtime environment, resulting in smaller Docker images. This approach improves build efficiency by leveraging caching mechanisms and avoiding redundant installations. It also enhances security by isolating build tools and dependencies, thereby reducing the potential attack surface of the final image.

## Docker Compose

The Docker Compose file is used to define and manage the services required to run the FoodTrucks application. It sets up the Elasticsearch service, the FoodTrucks Flask application service, and the Nginx reverse proxy service.

The Compose file also defines two custom networks: `foodtrucks-es.net` and `foodtrucks-proxy.net`. It also defines a volume named `elasticsearch-data` for persisting Elasticsearch data.

## Nginx

The `nginx.conf` file configures Nginx to serve static files, handle React frontend requests, and act as a reverse proxy to forward requests to the FoodTrucks Flask backend. It provides an efficient and scalable setup to serve the frontend and seamlessly connect it with the backend, ensuring smooth communication between the client and the server components of the application.

# Getting Started

To set up and run the FoodTrucks application, follow these steps:

1. Clone the project repository.
2. Ensure that Docker and Docker Compose are installed on your system.
3. Open a terminal and navigate to the project directory.
4. Build and run the Docker containers using the following command:

```bash
docker-compose up -d
```

5. Access the application by opening a web browser and navigating to http://localhost.

# Usage

Once the application is running, you can use the search functionality to find food trucks. The search engine powered by Elasticsearch will provide accurate and relevant results. The map provided by Mapbox will display the locations of the food trucks.
