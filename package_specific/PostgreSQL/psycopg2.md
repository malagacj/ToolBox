# Psycopg2
Many Python applications need psycopg2 to interact with PostgreSQL

## Prerequisites
Check Postgresql version
```
psql --version
```

In order to install psycopg2 the postgresql-server-dev-X.Y package must be installed for compilation to complete succesfully (Warning: Sometimes Y version is not required, check repository first)
```
sudo apt-get install postgresql-server-dev-X.Y
```

Alternately install psycopg2-binary package

## Installation
To install psycopg2 run the following command:
```
pip install psycopg2
```

Or:

```
pip install psycopg2-binary
```

## Notes
It is recommended to install the python packages in a virtual environment
