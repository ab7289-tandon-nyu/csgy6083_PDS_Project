"""Application config
Environment variables will take precedence
for debugging create a top level .env file"""
from environs import Env

env = Env()
env.read_env()

ENV = env.str("ENV")
DEBUG = ENV == "dev"
