import ldap
from django_auth_ldap.config import LDAPSearch, PosixGroupType
import os


AUTHENTICATION_BACKENDS = [
    "django_auth_ldap.backend.LDAPBackend",
    "django.contrib.auth.backends.ModelBackend",
]

AUTH_LDAP_SERVER_URI = os.environ.get("AUTH_LDAP_SERVER_URI")

AUTH_LDAP_BIND_DN = os.environ.get("AUTH_LDAP_BIND_DN")
AUTH_LDAP_BIND_PASSWORD = os.environ.get("AUTH_LDAP_BIND_PASSWORD")
AUTH_LDAP_USER_SEARCH = LDAPSearch(
    "ou=marvel,dc=example,dc=com", ldap.SCOPE_SUBTREE, "(uid=%(user)s)"
)


AUTH_LDAP_GROUP_SEARCH = LDAPSearch(
    "ou=marvel,dc=example,dc=com", ldap.SCOPE_SUBTREE, "(objectClass=posixGroup)"
)

AUTH_LDAP_GROUP_TYPE = PosixGroupType()
 
AUTH_LDAP_USER_FLAGS_BY_GROUP = {
    "is_active": "cn=avengers,ou=marvel,dc=example,dc=com",
    "is_staff": "cn=avengers,ou=marvel,dc=example,dc=com",
    "is_superuser": "cn=avengers,ou=marvel,dc=example,dc=com",
}
