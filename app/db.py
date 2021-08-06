import pymysql
import pymysql.cursors


class DBManager:
    def __init__(self):
        """
        Initializes the DB manager class. At init it retrieves the mysql
        object from extensions.
        """
        from .extensions import mysql

        self.mysql = mysql

    def get_connection(self, autocommit=False):
        """initiates the connection with the database"""
        with self.mysql.connect(
            autocommit=autocommit, cursorclass=pymysql.cursors.DictCursor
        ) as conn:
            yield conn

    def get_cursor(self, autocommit=False, commit=False):
        """yields a cursor from the connection"""
        # self.conn = self.mysql.connect()
        # self.cursor = self.conn.cursor()

        conn = self.get_connection(autocommit=autocommit)
        with conn.cursor() as cursor:
            yield cursor

        if commit:
            conn.commit()
