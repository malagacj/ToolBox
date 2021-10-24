# syntax=docker/dockerfile:1
FROM python:3

ENV PYTHONUNBUFFERED=1

RUN pip install -U pip setuptools

WORKDIR /code

COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY . /code/
