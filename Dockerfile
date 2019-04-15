FROM python:3.7-alpine
MAINTAINER A Goody

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure
RUN mkdir /counselMe
WORKDIR /counselMe
COPY ./counselMe/ /counselMe

RUN adduser -D aaron
USER aaron