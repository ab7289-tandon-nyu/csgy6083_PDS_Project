from typing import Any, List, Optional, Tuple

from jinjasql import JinjaSql

from app.db import DBManager
from app.user.models import Customer, Role, User


class UserManager(DBManager):
    """Class to encapsulate database operations on users"""

    def __init__(self):
        super(UserManager, self).__init__()

    def get_user_id(self, user_name: str) -> Optional[int]:
        """Given a `user_name`, returns the integer primary key of that user, or None"""
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "SELECT `user_id` FROM `ab_user` WHERE `user_name`=%s"
                try:
                    cursor.execute(sql, (user_name,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was an error retrieving the user_id for user {user_name}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(
                        f"Did not find a user_id for user_name: {user_name}", flush=True
                    )
                    return None
                return int(result.get("user_id"))

    def _get_by_field(self, value: Any, field_name: str = "user_id") -> Optional[User]:
        """internal definition of the get_by_id method"""
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                # need the {{ value | sqlsafe }} for column or table names
                # otherwise JinjaSQL quotes them as if they were user input data
                sql_template = """
                    SELECT `user_id`, `user_name`, `email`, `type`, `password`
                    FROM `ab_user`
                    WHERE {{ field_name | sqlsafe }} = {{ field_value }}
                """
                data = {"field_name": field_name, "field_value": value}
                # use JinjaSQL to generate dynamic SQL queries while allowing us to still
                # take advantage of parameterized statements in pymysql
                query, bind_params = JinjaSql().prepare_query(sql_template, data)

                try:
                    cursor.execute(query, bind_params)
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"Exception was thrown while retrieving user by id {value}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    return None
                return User(**result)

    def get_by_id(self, id: int) -> Optional[User]:
        """Retrieves a user record from the database by its id"""
        return self._get_by_field(id, field_name="user_id")

    def get_by_username(self, user_name: str) -> Optional[User]:
        """Retrieves a User record from the dabatase or returns None"""
        return self._get_by_field(user_name, field_name="user_name")

    def create_user(self, new_user: User) -> bool:
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

    def delete_user(self, user_id: int) -> bool:
        """deletes a user with the specified ID"""
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_user` WHERE `user_id`=%s"
                try:
                    cursor.execute(sql, (user_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There wasn an error deleted user {user_id}. EX {ex}",
                        flush=True,
                    )
                    return False
                return True


class CustomerManager(UserManager):
    """Convenience class to encapsulate Database operations on Customers"""

    def __init__(self):
        super(CustomerManager, self).__init__()

    def get_by_username(self, user_name: str) -> Optional[Tuple[Customer, User]]:
        user = super().get_by_username(user_name)
        if not user:
            print(
                f"CustomerManager.get_by_username - No User found with name {user_name}",
                flush=True,
            )
            return None
        else:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    sql = (
                        "SELECT `u`.`user_name`, `u`.`email`, `c`.`fname`, `c`.`mname`, `c`.`lname`, "
                        "`c`.`gender`, `c`.`marital_status`, `c`.`street_1`, `c`.`street_2`, `c`.`city`,"
                        " `c`.`state`, `c`.`zip`, `u`.`type`, `u`.`user_id`, `u`.`password`"
                        "FROM `ab_user` `u`"
                        "JOIN `ab_customer` `c`"
                        "ON `u`.`user_id`=`c`.`user_id`"
                        "WHERE `c`.`user_id`=%s"
                    )
                    try:
                        cursor.execute(sql, (user.user_id,))
                        result = cursor.fetchone()
                    except Exception as ex:
                        print(
                            f"An error was thrown retrieving Customer {user_name}. EX: {ex}",
                            flush=True,
                        )
                        return None
                    if not result:
                        print(
                            f"No customer found with user_name {user_name}", flush=True
                        )
                        return None
                    return Customer(**result), user

    def get_by_id(self, user_id: int) -> Optional[Tuple[Customer, User]]:
        user = super().get_by_id(user_id)
        if not user:
            print(
                f"CustomerManager.get_by_id - No User found with ID {user_id}",
                flush=True,
            )
            return None
        else:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    sql = (
                        "SELECT `u`.`user_name`, `u`.`email`, `c`.`fname`, `c`.`mname`, `c`.`lname`, "
                        "`c`.`gender`, `c`.`marital_status`, `c`.`street_1`, `c`.`street_2`, `c`.`city`,"
                        " `c`.`state`, `c`.`zip`, `u`.`type`, `u`.`user_id`, `u`.`password`"
                        "FROM `ab_user` `u`"
                        "JOIN `ab_customer` `c`"
                        "ON `u`.`user_id`=`c`.`user_id`"
                        "WHERE `c`.`user_id`=%s"
                    )
                    try:
                        cursor.execute(sql, (user_id,))
                        result = cursor.fetchone()
                    except Exception as ex:
                        print(
                            f"An error was thrown retrieving customer {user_id}. EX: {ex}",
                            flush=True,
                        )
                        return None
                    if not result:
                        print(f"No customer found with id: {user_id}", flush=True)
                        return None
                    return Customer(**result), user

    def create_customer(self, new_customer: Customer) -> bool:
        """Creates a new User and Customer instance in the database"""
        new_user = User(new_customer.user_name, new_customer.email, type="C")
        new_user.set_password(new_customer.password)

        inserted = super().create_user(new_user)
        if not inserted:
            print(
                "CustomerManager.create_customer - "
                f"there was an error creating the user record, customer: {new_customer}",
                flush=True,
            )
            return False

        user_id = self.get_user_id(new_customer.user_name)
        if not user_id:
            print(
                f"CustomerManager.create_customer - Unable to retrieve user for : {new_customer}",
                flush=True,
            )
            return False

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "INSERT INTO `ab_customer` (`user_id`, `fname`, `mname`, `lname`, `gender`, "
                    "`marital_status`, `street_1`, `street_2`, `city`, `state`, `zip`)"
                    "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            user_id,
                            new_customer.fname,
                            new_customer.mname,
                            new_customer.lname,
                            new_customer.gender,
                            new_customer.marital_status,
                            new_customer.street_1,
                            new_customer.street_2,
                            new_customer.city,
                            new_customer.state,
                            new_customer.zip,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was an exception inserting customer {new_customer} in DB. EX: {ex}",
                        flush=True,
                    )
                    self.delete_user(user_id)
                    return False
                return True


class RoleManager(DBManager):
    def __init__(self):
        super(RoleManager, self).__init__()

    def get_by_id(self, role_id: int) -> Optional[Role]:
        """Retrieves a role record for the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `name`, `desc`, `role_id`"
                    "FROM `ab_role`"
                    "WHERE `role_id`=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (role_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to fetch role for id: {role_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No role found for role_id= {role_id}", flush=True)
                    return None
                return Role(**result)


class UserRoleManager(DBManager):
    def __init__(self):
        super(UserRoleManager, self).__init__()
        self.userManager = UserManager()
        self.roleManager = RoleManager()

    def get_roles_for_user(self, user_id: int) -> Optional[List[Role]]:
        """Retrieves the list of roles for the specified user"""
        pass
        # user = self.userManager.get_by_id(user_id)
