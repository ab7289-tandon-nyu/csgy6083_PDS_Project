from typing import List, Optional

from jinjasql import JinjaSql

from app.db import DBManager
from app.policy.models import AutoPolicy, HomePolicy, Policy


class PolicyManager(DBManager):
    def __init__(self):
        super(PolicyManager, self).__init__()

    def get_by_id(self, policy_id: int) -> Optional[Policy]:
        """Retrieves an insurace Policy record with the specified ID or returns None"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `start_date`, `end_date`, `premium`, `type`, `state`, "
                    "`active`, `policy_id`, `user_id`"
                    "FROM `ab_policy`"
                    "WHERE `policy_id=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (policy_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was an error retrieving the ab_policy record for id {policy_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No Policy found for id {policy_id}", flush=True)
                    return None
                return Policy(**result)

    def delete(self, policy_id: int) -> bool:
        """Deletes a policy record with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_policy` WHERE `policy_id`=%s"
                try:
                    cursor.execute(sql, (policy_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was an error deleting the ab_policy record for id {policy_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def get_policies_for_user(
        self, user_id: int, p_type: str = None
    ) -> Optional[List[Policy]]:
        """Retrieves the list of policies associated with a specified user for the specified type"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                results = None
                sql_template = """
                    SELECT `start_date`, `end_date`, `premium`, `p_type`
                    `state`, `active`, `policy_id`
                    FROM `ab_policy`
                    WHERE `user_id`={{ user_id }}
                    {% if type %}
                    AND `p_type`={{ type }}
                    {% endif %}
                """
                data = {"user_id": user_id, "type": p_type}
                query, bind_params = JinjaSql().prepare_query(sql_template, data)

                try:
                    cursor.execute(query, bind_params)
                    results = cursor.fetchmany()
                except Exception as ex:
                    print(
                        f"There was an error retrieving the ab_policy records for user_id {user_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(f"No Policies found for user_id {user_id}", flush=True)
                    return None
                return [Policy(**result) for result in results]


class HPolicyManager(PolicyManager):
    def __init__(self):
        super(HPolicyManager, self).__init()

    def check_id_valid(self, policy_id: int) -> bool:
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "SELECT `policy_id` FROM `ab_home` WHERE `policy_id`=%s"
                result = None
                try:
                    cursor.execute(sql, (policy_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        "There wasn a DB Error when trying to find an ab_home record by"
                        f" id {policy_id}. Ex: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(
                        f"Unable to find a Home Insurance policy in ab_home policy with id {policy_id}",
                        flush=True,
                    )
                    return False
                return True

    def get_by_id(self, policy_id: int) -> Optional[HomePolicy]:
        """Returns a HomePolicy record associated with the specified ID, or None"""

        if self.check_id_valid(policy_id):
            if policy := super().get_by_id(
                policy_id
            ):  # the assignment operator := checks truthiness and assigns a value
                return HomePolicy.from_parent(policy)
        return None


class APolicyManager(PolicyManager):
    def __init__(self):
        super(APolicyManager, self).__init__()

    def check_id_valid(self, policy_id: int) -> bool:
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "SELECT `policy_id` FROM `ab_auto` WHERE `policy_id`=%s"
                result = None
                try:
                    cursor.execute(sql, (policy_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        "There wasn a DB Error when trying to find an ab_auto policy record by"
                        f" id {policy_id}. Ex: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(
                        f"Unable to find an Auto Insurance policy in ab_auto with id {policy_id}",
                        flush=True,
                    )
                    return False
                return True

    def get_by_id(self, policy_id: int) -> Optional[AutoPolicy]:
        """Returns an AutoPolicy record associated with the specified ID, or None"""

        if self.check_id_valid(policy_id):
            if policy := super().get_by_id(
                policy_id
            ):  # the assignment operator := checks truthiness and assigns a value
                return AutoPolicy.from_parent(policy)
        return None
