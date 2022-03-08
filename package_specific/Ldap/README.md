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



## Resources
[Marc Venteo](https://www.youtube.com/watch?v=6HkIDr3QF8Y&t=573s)
[Digital ocean configuration](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-ubuntu-16-04)
