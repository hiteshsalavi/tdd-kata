# TDD Kata

This guide will help you set up and clean up the TDD Kata environment using the provided Makefile.

## Prerequisites

- Docker
- Docker Buildx (Mostlikely, already installed with Docker)

## Getting Started

To build and run the container, follow these steps:

1. **Build and Run the Container**

    Use the `make build` & `make up` command to build the Docker image and run the container respectively:

    ```sh
    make build
    make up
    ```

    This command will:
    - Build the Docker image with the tag `tdd-kata:latest`.
    - Run the container named `tdd-kata` with the current directory mounted to `/tdd-kata/main` inside the container.

To cleanup the container and image, follow these steps:

1. **Clean up the environment**

    To stop and remove the container and image, use the `make down` command:

    ```sh
    make down
    ```

    This command will:
    - Stop the running container named `tdd-kata`.
    - Remove the Docker image with the tag `tdd-kata:latest`.

## Notes

- Ensure Docker is running on your machine before executing the commands.

For any issues or questions, please refer to the Docker and Makefile documentation.
