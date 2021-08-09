from typing import Optional

# from flask import current_app
from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash


class User(UserMixin):
    """DTO Object for the User model"""

    def __init__(
        self,
        user_name: str,
        email: str,
        type: str = "E",
        user_id: str = -1,
        password: Optional[str] = None,
    ):
        self.user_id = user_id
        self.user_name = user_name
        self.email = email
        self.type = type
        self.password = password

    def get_id(self) -> str:
        """override the flask-login provided get_id function since we dont have an `id` field"""
        return str(self.user_id)

    def set_password(self, password: str) -> None:
        """Convenience method to generate hashed and salted password"""
        self.password = generate_password_hash(password)

    def check_password(self, password: str) -> bool:
        """convenience method to check that the supplied password matches the hash"""
        return check_password_hash(self.password, password) or password == self.password

    def __repr__(self):
        """Represents instance as a unique string"""
        return f"<User({self.user_id} {self.user_name})>"


class Customer(User):
    """DTO Object for the Customer Class"""

    def __init__(
        self,
        user_name: str,
        email: str,
        fname: str,
        mname: str,
        lname: str,
        gender: str,
        marital_status: str,
        street_1: str,
        street_2: str,
        city: str,
        state: str,
        zip: str,
        type: str = "C",
        user_id: int = -1,
        password: Optional[str] = None,
    ):
        super(Customer, self).__init__(
            user_name, email, type, user_id=user_id, password=password
        )
        self.fname = fname
        self.mname = mname
        self.lname = lname
        self.gender = gender
        self.marital_status = marital_status
        self.street_1 = street_1
        self.street_2 = street_2
        self.city = city
        self.state = state
        self.zip = zip

    def __repr__(self):
        """Represents instance as a unique string"""
        return f"<Customer({self.user_id}, {self.user_name})>"


class Role:
    """DTO Object for the Role Model"""

    def __init__(self, role_id: int, name: str, desc: str):
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
