# Server Setup

## Steps

### 1) Users
#### Create user
Login as a sudoer and create new user

```bash
sudo adduser <username>
```

#### Add user as sudoer (optional)

#### SSH Access
##### Create ssh structure for user keys
```bash
su <username>
cd
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys
```

##### Add access to user
Use one of the following methods
* ssh-copy-id method
```bash
ssh-copy-id <username>@server_ip (To copy id.pub to host)
```

* Get public key from user 
```bash
cat /tmp/id_rsa.john.pub >> ~/.ssh/authorized_keys
cat /tmp/id_rsa.josie.pub >> ~/.ssh/authorized_keys
cat /tmp/id_rsa.jessica.pub >> ~/.ssh/authorized_keys
```



### 2) Install server commom packages
Use [script](/os_specific/linux/scripts/initial_packages.sh) in this project

```bash
/os_specific/linux/scripts/initial_packages.sh
```

## References
1. [https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server](https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server)
