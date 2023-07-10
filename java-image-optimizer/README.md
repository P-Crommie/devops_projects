# Image Optimizer

This project provides an image optimization solution through a Dockerized application. The application optimizes images using the [pngtastic](https://github.com/pngtastic/pngtastic) library. It allows you to specify an input directory containing images to be optimized and an output directory where the optimized images will be stored.

## Authors

[Emmanuel Cromwell](https://github.com/blacrommie)

## Project Structure

```bash
├── dockerfile
├── entry-point.sh
├── imgs
│   ├── in
│   │   ├── fractal-1938690_1280.jpg
│   │   └── park.jpg
│   └── out
├── init-image-optimizer.sh
├── pom.xml
└── src
    ├── main
    │   └── java
    │       └── nl
    │           └── openweb
    │               └── image
    │                   └── Optimizer.java
    └── README.md

```

The `dockerfile` contains the instructions for building the Docker image. It starts with the `maven:3-eclipse-temurin-8-alpine` base image, sets the working directory to `/usr/src/optimizer`, and copies the `entry-point.sh` script to `/usr/local/bin`. The script is made executable. It then copies the source code (`./src`) and the `pom.xml` file to the working directory. The `mvn package` command is run to build the project. Finally, the `imgs/in` and `imgs/out` directories are created and given appropriate permissions. The `entry-point.sh` script is set as the entry point for the container.

The `entry-point.sh` script runs the Java application that optimizes images. It executes the application by specifying the classpath and the entry point JAR file. The input and output directories are provided as arguments to the application.

The `init-image-optimizer.sh` script is responsible for running the Docker container and initiating the image optimization process. It checks the existence of the input and output directories, builds the Docker image, and creates a container with the directories mounted. The image optimization is performed within the container.

# Installation

To run the image optimizer, follow these steps:

1. Install Docker on your system if you haven't already.
2. Clone the project repository.
3. Open a terminal and navigate to the project directory.

# Getting Started

To optimize images using the Docker container, use the following command:

```bash
./init-image-optimizer.sh PWD/my-in-dir/ PWD/my-out-dir/
```

Replace PWD/my-in-dir/ with the path to your input directory containing the images to be optimized and PWD/my-out-dir/ with the path to the output directory where the optimized images will be stored.

The image optimization process will be initiated within the container, and the optimized images will be saved in the output directory.

Ensure that the provided directories exist and are accessible.
