image = tdd-kata
tag = latest
container = tdd-kata
pwd = $(shell pwd)
workdir = /tdd-kata/main

build:
	DOCKER_BUILDKIT=1 docker buildx build --progress=plain --no-cache -t $(image):$(tag) .

up:
	docker run -d --name $(container) --volume $(pwd):$(workdir) --rm $(image):$(tag)

down:
	@docker stop $(container)
	@docker rmi $(image):$(tag)
