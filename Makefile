image = tdd-kata
tag = latest
container = tdd-kata
pwd = $(shell pwd)
workdir = /tdd-kata/main

# TTY flag during docker exec causes GitHub action to fail. Use with caution
root_exec = docker exec -i $(container)
bundle_exec = $(root_exec) bundle exec

build:
	DOCKER_BUILDKIT=1 docker buildx build --build-arg BUNDLE_I_FLAGS="" -t $(image):$(tag) .

up: _require_image
	docker run -d --name $(container) --volume $(pwd):$(workdir) --rm $(image):$(tag)

down: _require-container-up
	@docker stop $(container)
	@docker rmi $(image):$(tag)

path ?= spec
t: _require-container-up
	@$(bundle_exec) rspec $(path)


# --------
# Helpers |
# --------

# RED='\033[0;31m'
# GREEN='\033[0;32m'
# YELLOW='\033[0;33m'
# NC='\033[0m' # No Color
_require-container-up:
	@if [ -z "$(shell docker ps -q -f name=$(container))" ]; then \
		echo "Container\033[0;33m $(container)\033[0m is \033[0;31mnot running\033[0m. Please run \033[0;32m'make up'\033[0m first."; \
		exit 1; \
	fi

_require_image:
	@if [ -z "$(shell docker images -q -f reference=$(image):$(tag))" ]; then \
		echo "Image\033[0;33m $(image):$(tag)\033[0m does \033[0;31mnot exist\033[0m. Please run \033[0;32m'make build'\033[0m first."; \
		exit 1; \
	fi