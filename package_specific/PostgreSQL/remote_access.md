# Remote access

## Allow outside connections
find postgresql.conf file
```
find / -name "postgresql.conf"
```

Open postgresql.conf and replace the line
```
listen_addresses = 'localhost'
```

with

```
listen_addresses = '*'
```

## Configure pg_hba.conf
find pg_hba.conf file
```
find / -name "pg_hba.conf"
```

Open pg_hba.conf and add the following line to the bottom of it
```
host    all    all    0.0.0.0/0    md5
host    all    all    ::/0         md5
```

## Restart postgresql server
Run the following command
```
sudo systemctl restart postgresql
```
