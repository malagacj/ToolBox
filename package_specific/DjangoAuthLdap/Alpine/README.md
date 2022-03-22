# Alpine (Docker)
Sample Dockerfiles can be found in the [dockerfile_samples][Dockerfile samples]' folder

Note that the sample Dockerfiles are not exactly the same as the code shown here.

The Dockerfiles have been optimized so that the images created weight as little as possible. This may include putting several lines into one RUN command

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

## References
[Django-auth-ldap workaround]

[Dockerfile samples]: dockerfile_samples
[Django-auth-ldap workaround]: https://stackoverflow.com/questions/70182720/python-ldap-3-4-installation-fails-on-alpine-images
