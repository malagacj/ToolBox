# Remote access

## Allow outside connections
The default user 'guest' cannot access rabbitmq-server from outside localhost

rabbitmqctl must be used to create other users to allow remote connections

## Add user
Use the following command create a new user
```
sudo rabbitmqctl add_user <user_name> <password>
i.e.
sudo rabbitmqctl add_user test test_password
```

Assign tags to the user
```
sudo rabbitmqctl set_user_tags <user_name> <tag>
i.e.
sudo rabbitmqctl set_user_tags test administrator
```

Set user permissions
```
sudo rabbitmqctl set_permissions -p / <user_name> ".*" ".*" ".*"
i.e.
sudo rabbitmqctl set_permissions -p / test ".*" ".*" ".*"
```

## References
https://stackoverflow.com/questions/22850546/cant-access-rabbitmq-web-management-interface-after-fresh-install/22854222#22854222
