import os
from flask import Flask
import mysql.connector

class DBManager:
    def __init__(self, database='pds', host='db', user='root', password_file=None, password="password"):
        self.connection = mysql.connector.connect(
            user=user,
            password=password,
            host=host, # name of the mysql service as set in the docker-compose file
            database=database,
            auth_plugin='mysql_native_password'
        )
        self.cursor = self.connection.cursor()

    def populate_db(self):
        pass