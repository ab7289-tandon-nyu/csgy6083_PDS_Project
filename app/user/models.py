from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash

from app.db import DBManager


class UserManager(DBManager):
    """Class to encapsulate database operations on users"""

    def __init__(self):
        super(UserManager, self).__init__()

    def get_by_username(self, user_name):
        """Retrieves a User record from the dabatase or returns None"""
        cursor = self.get_cursor()
        sql = (
            "SELECT `user_id`, `user_name`, `email`, `type`, `password`"
            "FROM `ab_user` WHERE `user_id`=%s"
        )
        try:
            result = cursor.execut(sql, (user_name,)).fetchone()
        except Exception as ex:
            print(f"And exception was thrown: {ex}")
            return None
        return User(**result)


class User(UserMixin):
    """DTO Object for the User model"""

    def __init__(self, user_id, user_name, email, type="C", password=None):
        self.user_id = user_id
        self.user_name = user_name
        self.email = email
        self.type = type
        if password:
            self.set_password(password)
        else:
            self.password = None

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
