# Creating a Database

## Create Database
In order to create a database without an owner use:
```
createdb --encoding=UTF8 <database_name>
```

In order to create a database with an owner use:
```
createdb --encoding=UTF8 --owner=<role_name> <database_name>
```

## Notes
Superuser permissions are needed for creating databases
