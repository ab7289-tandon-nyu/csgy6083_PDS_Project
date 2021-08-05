from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash


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
        return check_password_hash(self.password, password)

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
