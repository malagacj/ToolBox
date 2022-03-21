# Django Auth Ldap

Django-auth-ldap package allows django projects to make use of Ldap users and groups. These uses range from authenticating users, using groups for filtering and using groups for user's permissions!

Django-auth-ldap needs to compile against each OS when it is installed. This guide will provide a list of prerequisites to be installed on each OS previous to django-auth-ldap installation

## OS specific prerequisites
* [Debian 11 (Buster)]
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

[Debian 11 (Buster)]: debian11_buster.md
[Alpine]: alpine.md
[ldap.py]: ldap.py
