# formatting
NONE=\033[00m
GREEN=\033[01;32m
BOLD=\033[1m
UNDERLINE=\033[4m

help:
	@echo ""
	@echo "${UNDERLINE} Development Environment (vscode): ${NONE}"
	@echo " ${BOLD} docker-build : ${GREEN} Builds the Docker Image${NONE}"
	@echo " ${BOLD} docker-run : ${GREEN} Runs the Docker Image${NONE}"
	@echo " ${BOLD} run-notebook : ${GREEN} Builds and Runs the Docker Image${NONE}"
	@echo ""

ROOT_DIR:=$(shell pwd)

docker-build:
	@echo "Building the Docker Image ..."
	docker build --no-cache -f ${ROOT_DIR}/docker/Dockerfile . -t jupyter_notebook

docker-run:
	docker run -p 8888:8888 -e NB_USER="sheikh" -e CHOWN_HOME=yes -v "${ROOT_DIR}/docker/playground":/home/jovyan/playground jupyter_notebook /bin/bash -c "/usr/local/bin/start-notebook.sh"

run-notebook: docker-build docker-run
	@echo "Starting the Jupyter Notebook Service ..."