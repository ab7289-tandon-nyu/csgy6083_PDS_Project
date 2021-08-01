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

print(f"flask app: {FLASK_APP}")
