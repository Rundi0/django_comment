FROM python:3.12-slim

RUN apt-get update
RUN apt-get install -y supervisor
RUN pip3 install pip-tools

RUN mkdir /code
WORKDIR /code
COPY ./requirements/ /code/requirements/

RUN python -m piptools sync requirements/main.txt
