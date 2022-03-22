import os

ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS', '').split(',')
