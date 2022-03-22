# Alpine (Docker)
Sample Dockerfiles can be found in the [dockerfile_samples][Dockerfile samples]' folder

## Docker image: Python3.10 - Alpine 3.15
### Packages
A [workaround][Django-auth-ldap workaround] is required to be able to install "django-auth-ldap"
```bash
RUN echo -n "INPUT ( libldap.so )" > /usr/lib/libldap_r.so
```
These are the build packages required
```bash
RUN apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev
```

This package is required for "django-auth-ldap" correct operation
```bash
RUN apk add --no-cache openldap-dev
```

[Dockerfile samples]: dockerfile_samples
[Django-auth-ldap workaround]: https://stackoverflow.com/questions/70182720/python-ldap-3-4-installation-fails-on-alpine-images
