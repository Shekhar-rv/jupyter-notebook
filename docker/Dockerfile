FROM jupyter/scipy-notebook:latest

USER $NB_UID


WORKDIR /home/jovyan/packages
COPY docker/requirements.txt /home/jovyan/packages/requirements.txt
RUN pip install -r requirements.txt

ENV ENV="dev"

WORKDIR /home/jovyan