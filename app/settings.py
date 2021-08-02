"""Application config
Environment variables will take precedence
for debugging create a top level .env file"""
from environs import Env

env = Env()
env.read_env()

ENV = env.str("FLASK_ENV")
DEBUG = ENV == "dev"
FLASK_APP = env.str("FLASK_APP")
SECRET_KEY = env.str("SECRET_KEY")

# MySQL Settings

MYSQL_DATABASE_HOST = env.str("MYSQL_HOST")
MYSQL_DATABASE_PORT = env.int("MYSQL_PORT")
MYSQL_DATABASE_USER = env.str("MYSQL_USER")
MYSQL_DATABASE_PASSWORD = env.str("MYSQL_PASSWORD")
MYSQL_DATABASE_DB = env.str("MYSQL_DB")
