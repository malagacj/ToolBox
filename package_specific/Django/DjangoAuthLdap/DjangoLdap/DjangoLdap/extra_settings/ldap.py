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
    os.environ.get("AUTH_LDAP_USER_SEARCH"),
    ldap.SCOPE_SUBTREE, "(uid=%(user)s)"
)


AUTH_LDAP_GROUP_SEARCH = LDAPSearch(
    os.environ.get("AUTH_LDAP_GROUP_SEARCH"),
    ldap.SCOPE_SUBTREE, "(objectClass=posixGroup)"
)

AUTH_LDAP_GROUP_TYPE = PosixGroupType()
 
AUTH_LDAP_USER_FLAGS_BY_GROUP = {
    "is_active": os.environ.get("AUTH_LDAP_USER_FLAGS_IS_ACTIVE"),
    "is_staff": os.environ.get("AUTH_LDAP_USER_FLAGS_IS_STAFF"),
    "is_superuser": os.environ.get("AUTH_LDAP_USER_FLAGS_IS_SUPERUSER")
}
