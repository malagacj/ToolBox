# NGINX Cheatsheet

## Installation
```
sudo apt-get install nginx
```

## Useful Commands
Checking for correct syntax in settings

```
nginx -t
```

## Useful Configs
Nginx useful configs for config files

```
location /pdfs/ {
	include /etc/nginx/mime.types;
}
```
