# TDD Kata

This guide will help you set up and clean up the TDD Kata environment using the provided Makefile.

## Prerequisites

- Docker
- Docker Buildx [Most likely already installed with Docker]

## Getting Started

Guide will help you build, run & cleanup. follow these steps:

1. **Build and Run the Container**

    Use the `make build` & `make up` command to build the Docker image and run the container respectively:

    ```sh
    make build
    make up
    ```

    This command will:
    - Build the Docker image with the tag `tdd-kata:latest`.
    - Run the container named `tdd-kata` with the current directory mounted to `/tdd-kata/main` inside the container.

2. **Running Tests**

    To run tests inside the container, use the `make t` command:

    ```sh
    make t
    ```

    **OPTIONAL**: You can specify a different path for the tests by setting the `path` variable:

    ```sh
    make t path=spec/your_test_directory_or_spec_file
    ```

3. **Cleaning Up**

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