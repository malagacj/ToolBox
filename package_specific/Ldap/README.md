# LDAP

LDAP is used to centralice user accounts, information and configurations. It is multiplatform.\
More information in the following [link][1]\
This is guide will help you to set up LDAP asap. For a more complete server configuration use [Digital ocean configuration]'s guide

## Prerequistes
### Debian 11 (Bullseye)
```bash
sudo apt update && sudo apt upgrade
sudo apt install slapd ldap-utils
```
Install slapd with any password, it will be change later on with "dpkg-reconfigure"


## Configuration
```bash
sudo dpkg-reconfigure slapd
```
Configure slapd by following "[Marc Venteo]'s video" or "Digital Ocean configuration". A brief summary is described next:

1. Omit LDAP Server configuration
![Step 01](images/ldap_01.png)
1. DNS Domain Name
![Step 02](images/ldap_02.png)
1. Organization Name
![Step 03](images/ldap_03.png)
1. ![Step 04](images/ldap_04.png)
1. ![Step 05](images/ldap_05.png)
1. ![Step 06](images/ldap_06.png)
1. ![Step 07](images/ldap_07.png)


## Common commands
### Adding Directory
Add directories defined in the .ldif files.
Like the sample files provided (ou.ldif, group.ldif, user.ldif)
```bash
sudo ldapadd -x -D cn=admin,dc=froylan,dc=ml -W -f ou.ldif
```

The password to be used for Ldap is the one created during the dpkg-reconfigure step

Use slapcat to verify the objectas that have been created

```bash
sudo slapcat
```

For user's passwords use (psswd=marvel)

```bash
sudo slappasswd
```


## Resources
* [Marc Venteo]
* [Digital ocean configuration]
* [Active Directory Explanation]

[1]: https://www.youtube.com/watch?v=zpXDMlXwW_I&list=PLw0uO9wnBmUmTOWbqvTudjJEjQFV5diTk&index=1
[Marc Venteo]: https://www.youtube.com/watch?v=6HkIDr3QF8Y&t=573s
[Digital ocean configuration]: https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-ubuntu-16-04
[Active Directory Explanation]: https://www.youtube.com/watch?v=lFwek_OuYZ8
