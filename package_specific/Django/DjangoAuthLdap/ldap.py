import ldap
from django_auth_ldap.config import LDAPSearch, PosixGroupType


AUTHENTICATION_BACKENDS = [
    "django_auth_ldap.backend.LDAPBackend",
    "django.contrib.auth.backends.ModelBackend",
]


AUTH_LDAP_SERVER_URI = "ldap://192.168.1.149"


AUTH_LDAP_BIND_DN = "cn=admin,dc=example,dc=com"
AUTH_LDAP_BIND_PASSWORD = "osboxes.org"
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
