import os

SECRET_KEY = os.environ.get('SECRET_KEY', 'secure_secret_key')

ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS', '').split(',')
