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
        return self.mysql.connect()


class DTOBase:
    """
    Base Data Transfer Object class to implement base methods that
    other Data objects might want
    """

    __id_field__ = None
    __display__ = None

    def get_id(self):
        if not self.__id_field__ or self.__id_field__ is None:
            raise AttributeError("Need to implement __id_field__!")
        return getattr(self, self.__id_field__)

    def get_display_value(self):
        if not self.__display__ or self.__display__ is None:
            raise AttributeError("Need to implement __display__!")
        return getattr(self, self.__display__)
