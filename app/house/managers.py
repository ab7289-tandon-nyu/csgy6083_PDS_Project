from typing import List, Optional

from app.db import DBManager
from app.house.models import Home


class HomeManager(DBManager):
    def get_by_id(self, home_id: int) -> Optional[Home]:

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `purchase_date`, `purchase_value`, "
                    "`area`, `house_type`, `auto_fire_notif`, "
                    "`home_security`, `pool`, `basement`, "
                    "`home_id`, `policy_id` "
                    "FROM `ab_home` "
                    "WHERE `home_id`=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (home_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to retrieve home {home_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No home found for id: {home_id}", flush=True)
                    return None
                return Home(**result)

    def get_by_policy(self, policy_id: int) -> Optional[List[Home]]:
        """Retrieves a list of homes associated with the specified policy"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `purchase_date`, `purchase_value`, "
                    "`area`, `house_type`, `auto_fire_notif`, "
                    "`home_security`, `pool`, `basement`, "
                    "`home_id`, `policy_id` "
                    "FROM `ab_home` "
                    "WHERE `policy_id`=%s"
                )
                results = None
                try:
                    cursor.execute(sql, (policy_id,))
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB error when retrieving homes for policy: {policy_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(
                        f"No Homes found associated with policy: {policy_id}",
                        flush=True,
                    )
                    return None
                return [Home(**result) for result in results]

    def create(self, home: Home) -> Optional[int]:
        """Creates a new home record and returns its PK"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                home_id = None
                insert_sql = (
                    "INSERT INTO `ab_home` "
                    "(`purchase_date`, `purchase_value`, `area`, `house_type`, `auto_fire_notif`, "
                    "`home_security`, `pool`, `basement`, `policy_id`) "
                    "VALUES "
                    "(%s, %s, %s, %s, %s, %s, %s, %s, %s);"
                )
                select_sql = "SELECT LAST_INSERT_ID() AS 'id';"
                try:
                    cursor.execute(
                        insert_sql,
                        (
                            home.purchase_date,
                            home.purchase_value,
                            home.area,
                            home.house_type,
                            home.auto_fire_notif,
                            home.home_security,
                            home.pool,
                            home.basement,
                            home.policy_id,
                        ),
                    )
                    cursor.execute(select_sql)
                    home_id = cursor.fetchone().get("id", default=None)

                    if home_id is None or home_id == 0:
                        print(
                            "Insert ID didn't increment for home, rolling back.",
                            flush=True,
                        )
                        conn.rollback()
                    else:
                        conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to insert a new home. EX: {ex}",
                        flush=True,
                    )
                    return None
                return home_id

    def update(self, home: Home) -> bool:
        """Updates the Home record in the DB"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "UPDATE `ab_home` SET "
                    "`purchase_date`=%s, "
                    "`purchase_value`=%s, "
                    "`area`=%s, "
                    "`house_type`=%s, "
                    "`auto_fire_notif`=%s, "
                    "`home_security`=%s, "
                    "`pool`=%s, "
                    "`basement`=%s "
                    "WHERE `home_id`=%s;"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            home.purchase_date,
                            home.purchase_value,
                            home.area,
                            home.house_type,
                            home.auto_fire_notif,
                            home.home_security,
                            home.pool,
                            home.basement,
                            home.home_id,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when updating home {home.home_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def delete(self, home_id: int) -> bool:
        """deletes the home with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_home` WHERE `home_id`=%s;"
                try:
                    cursor.execute(sql, (home_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to delete home {home_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True
