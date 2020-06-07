# Common Setups

## Create a Postgres Role with superuser status
```
sudo -u postgres createuser -s <username>
```
username: Name of Linux user, as to allow him to create New Roles, Databases, Drop Items, etc...

## Create a New Role with the Database Owner Name
```
createuser -P <role_name>
```
role_name: Name of future database's owner (i.e. django, plo, etc...)

## Notes
To be able to create new users (without superuser status) a superuser account needs to be used
