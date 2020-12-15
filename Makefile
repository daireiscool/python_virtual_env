## all: install-devenv
# install-devenv: build

# Build the docker container
build:
	docker-compose pull
	docker-compose build

stack-up:
	docker-compose up -d

# Clean up docker container
stack-purge:
	docker-compose stop
	docker-compose kill
	docker-compose rm

# Clean local computer of *all* containers
prune-all:
	docker image prune -a

# Refresh dependencies (Docker images) and rebuild
stack-full-refresh:
	docker-compose build --no-cache --pull

# Open jupyter in localhost
jupyter:
	docker run -p 8888:8888 generic-python-virtual-env_python_docker

# Enter 'dev' container with bash
dev-bash:
	docker-compose run --rm --entrypoint "/bin/bash -c" python_docker bash

# make hello name=Worlid
hello:
	docker-compose run --rm python_docker python3 app/commands/test.py batch hello 

# make run-main
run-main:
	docker-compose run --rm python_docker python3 code_python/main.py batch main
