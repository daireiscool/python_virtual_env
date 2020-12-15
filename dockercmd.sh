#!bin/sh

# Convience wrapper for running shell commands

docker-compose run -rm  --entrypoint "/bin/bash -c" python_docker bash
