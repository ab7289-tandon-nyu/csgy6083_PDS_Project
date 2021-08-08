from flask import current_app
from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash

from app.db import DBManager


class User(UserMixin):
    """DTO Object for the User model"""

    def __init__(self, user_name, email, type="C", user_id=-1, password=None):
        self.user_id = user_id
        self.user_name = user_name
        self.email = email
        self.type = type
        self.password = password

    def get_id(self):
        """override the flask-login provided get_id function since we dont have an `id` field"""
        return str(self.user_id)

    def set_password(self, password):
        """Convenience method to generate hashed and salted password"""
        self.password = generate_password_hash(password)

    def check_password(self, password):
        """convenience method to check that the supplied password matches the hash"""
        return check_password_hash(self.password, password) or password == self.password

    def __repr__(self):
        """Represents instance as a unique string"""
        return f"<User({self.user_id} {self.user_name}>"


class Role:
    """DTO Object for the Role Model"""

    def __init__(self, role_id, name, desc):
        self.role_id = role_id
        self.name = name
        self.desc = desc

    def __repr__(self):
        """Represents instance as a unique string"""
        return f"<Role({self.role_id} {self.name})>"


class UserRole:
    def __init__(self, user_id, role_id):
        self.user_id = user_id
        self.role_id = role_id


class UserManager(DBManager):
    """Class to encapsulate database operations on users"""

    def __init__(self):
        super(UserManager, self).__init__()

    def get_by_id(self, id):
        """Retrieves a user record from the database by its id"""
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `user_id`, `user_name`, `email`, `type`"
                    "FROM `ab_user` WHERE `user_id`=%s"
                )
                try:
                    cursor.execute(sql, (id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(f"Exception was thrown while retrieving user by id {id}. EX: {ex}")
                    return None
                if not result:
                    return None
                return User(**result)

    def get_by_username(self, user_name):
        """Retrieves a User record from the dabatase or returns None"""
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `user_id`, `user_name`, `email`, `type`, `password`"
                    "FROM `ab_user` WHERE `user_name`=%s"
                )
                try:
                    cursor.execute(sql, (user_name,))
                    result = cursor.fetchone()
                    print(f"result: {result}", flush=True)
                except Exception as ex:
                    print(f"An exception was thrown: {ex}", flush=True)
                    return None
                current_app.logger.info(f"result: {result}")
                if not result:
                    return None
                return User(**result)

    def create_user(self, new_user):
        """persists a new user record"""
        
        with self.get_connection() as conn:
            with conn.cursor() as cursor:

                sql = (
                    "INSERT INTO `ab_user` (`user_name`, `email`, `type`, `password`)"
                    "VALUES (%s, %s, %s, %s)"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            new_user.user_name,
                            new_user.email,
                            new_user.type,
                            new_user.password,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"An error was thrown inserting user {new_user} into the database: {ex}"
                    )
                    raise ex
                    # return False
                return True
