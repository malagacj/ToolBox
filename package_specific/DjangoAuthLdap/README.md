# Django Auth Ldap

Django-auth-ldap package allows django projects to make use of Ldap users and groups. These uses range from authenticating users, using groups for filtering and using groups for user's permissions!

Django-auth-ldap needs to compile against each OS when it is installed. This guide will provide a list of prerequisites to be installed on each OS previous to django-auth-ldap installation

To set up a small Ldap Server have a look at the [Ldap Guide]

A simple "django-auth-ldap" project has been provided called [DjangoLdap]. This project is by no means thought to be deployed in production, it is just to see how django connects to a Ldap Server. The environment variables are defined in the .env file

## OS specific prerequisites
* [Debian]
* [Alpine]

## Django Config
A sample django configuration file [ldap.py] has been provided
```python
import ldap
from django_auth_ldap.config import LDAPSearch, PosixGroupType


AUTHENTICATION_BACKENDS = [
    "django_auth_ldap.backend.LDAPBackend",
    "django.contrib.auth.backends.ModelBackend",
]

AUTH_LDAP_SERVER_URI = "ldap://<ldap_ip>"


AUTH_LDAP_BIND_DN = "cn=admin,dc=example,dc=com"
AUTH_LDAP_BIND_PASSWORD = "<bind_password>"
AUTH_LDAP_USER_SEARCH = LDAPSearch(
    "<dn_for_user_search>", ldap.SCOPE_SUBTREE, "(uid=%(user)s)"
)

AUTH_LDAP_GROUP_SEARCH = LDAPSearch(
    "<dn_for_group_search>", ldap.SCOPE_SUBTREE, "(objectClass=posixGroup)"
)
AUTH_LDAP_GROUP_TYPE = PosixGroupType()
 
 
AUTH_LDAP_USER_FLAGS_BY_GROUP = {
    "is_active": "<dn_for_ldap_posix_group>",
    "is_staff": "<dn_for_ldap_posix_group>",
    "is_superuser": "<dn_for_ldap_posix_group>",
}
 
```

[Debian]: Debian
[Alpine]: Alpine
[ldap.py]: ldap.py
[Ldap Guide]: /package_specific/Ldap
[DjangoLdap]: DjangoLdap
