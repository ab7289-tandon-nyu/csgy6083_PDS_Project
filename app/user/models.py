class User:
    """DTO Object for the User model"""

    def __init__(self, user_id, user_name, email, type="C"):
        self.user_id = user_id
        self.user_name = user_name
        self.email = email
        self.type = type

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
