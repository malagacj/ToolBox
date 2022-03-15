# LDAP

## Prerequistes

### Debian 11 (Bullseye)
```bash
sudo apt update && sudo apt upgrade
sudo apt install slapd ldap-utils
```

Install slapd with any password, it will be change later on with "dpkg-reconfigure"

```bash
sudo dpkg-reconfigure slapd
```
Configure slapd by folowing "Mark Vendeo's video" or "Digital Ocean configuration"

## Common commands
### Adding Directory
Add directories defined in the .ldif files.
Like the sample files provided (ou.ldif, group.ldif, user.ldif)
```bash
sudo ldapadd -x -D cn=admin,dc=froylan,dc=ml -W -f ou.ldif
```

1) ![Step 01](./ldap_01.png)
2) ![Step 02](./ldap_02.png)
3) ![Step 03](./ldap_03.png)
4) ![Step 04](./ldap_04.png)
5) ![Step 05](./ldap_05.png)
6) ![Step 06](./ldap_06.png)
7) ![Step 07](./ldap_07.png)


## Resources
* [Marc Venteo](https://www.youtube.com/watch?v=6HkIDr3QF8Y&t=573s)
* [Digital ocean configuration](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-ubuntu-16-04)
