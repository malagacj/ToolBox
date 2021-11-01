# syntax=docker/dockerfile:1
FROM python:3-alpine

ENV PYTHONUNBUFFERED=1

RUN pip install -U pip setuptools

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev


# Sources
# https://hub.docker.com/_/python/

# https://medium.com/c0d1um/building-django-docker-image-with-alpine-32de65d2706
