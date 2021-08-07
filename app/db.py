class DBManager:
    def __init__(self):
        """
        Initializes the DB manager class. At init it retrieves the mysql
        object from extensions.
        """
        from .extensions import mysql

        self.mysql = mysql

    def get_connection(self):
        """initiates the connection with the database"""
        # with self.mysql.connect() as conn:
        #     yield conn
        return self.mysql.connect()

    def get_cursor(self, commit=False):
        """yields a cursor from the connection"""
        # self.conn = self.mysql.connect()
        # self.cursor = self.conn.cursor()

        # conn = next(self.get_connection())
        conn = self.get_connection()
        return conn.cursor()

        # conn = next(self.get_connection())
        # with conn.cursor() as cursor:
        #     yield cursor

        #     if commit:
        #         conn.commit()
