# TDD Kata

![tests](https://github.com/hiteshsalavi/tdd-kata/actions/workflows/tests.yml/badge.svg)

This is a solution to the [Incubyte TDD Kata](https://blog.incubyte.co/blog/tdd-assessment/).
This guide will help you set up and clean up the TDD Kata environment using the Makefile.

## Prerequisites

- Docker
- Docker Buildx [Most likely already installed with Docker]

## Getting Started

Follow these steps in order to run the container and tests:

1. **Build and Run the Container**

    Use the `make build` & `make up` command to build the Docker image and run the container respectively:

    ```sh
    make build
    make up
    ```

    This command will:
    - Build the Docker image with the tag `tdd-kata:latest`.
    - Run the container named `tdd-kata` with the current directory mounted to `/tdd-kata/main` inside the container.
    - This container has a mounted volume with host's cwd. This helps to modify the tests on the fly.

    **Note:**
    Running a command in container has never been so easy. Use `make exec`
    ```bash
    /workspaces/tdd-kata ➜ (main) $ make exec c="cat LICENSE | grep software"
    of this software and associated documentation files (the "Software"), to deal
    ```

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