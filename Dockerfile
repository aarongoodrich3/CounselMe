FROM python:3.7-alpine
MAINTAINER A Goody

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#Setup DB
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# Setup directory structure
RUN mkdir /counselMe
WORKDIR /counselMe
COPY ./counselMe/ /counselMe

RUN adduser -D aaron
USER aaron