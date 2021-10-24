# Django, Docker, Docker Compose

## Summary
This folder includes two sample files that together with the commands described here will start a bare Django project

The changes applied to the folder will immediatly apply to the container, this is good for developing!

## Steps to carry out
### 1) Docker-compose run
This command will start a new django project inside the container, using the packages installed in the Build step of the docker compose file, therefore no virtualenv is required.

```
sudo docker-compose run web django-admin startproject <project-name> .
```
Only use this command if you are starting a new project, otherwise just copy the files already created. This is done by the Dockerfile, so nothing has to be done


### 2) Check files
Verify that the files have been created

```
ls -l
```

All files created are owned by root because of the sudo command. Change files owner with the following command and verify ownership
```
sudo chown -R $USER:$USER .
ls -l
```


### 3) Build and start all containers
```
docker-compose up -d
```

or rebuild when you make changes
```
docker-compose up -d --build
```


### 4) Stop and Remove all containers
```
docker-compose down
```
