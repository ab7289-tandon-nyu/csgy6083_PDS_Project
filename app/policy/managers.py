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
                    "SELECT `start_date`, `end_date`, `premium`, `p_type`, `state`, "
                    "`active`, `policy_id`, `user_id`"
                    "FROM `ab_policy`"
                    "WHERE `policy_id`=%s"
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

    def create(self, policy: Policy) -> Optional[int]:
        """Creates a new Policy record and returns its PK"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                last_insert_id = 0
                policy_id = None
                insert_sql = (
                    "INSERT INTO `ab_policy` "
                    "(`p_type`, `start_date`, `end_date`, `premium`, `state`, `active`, `user_id`)"
                    " VALUES "
                    "(%s, %s, %s, %s, %s, %s, %s);"
                )
                select_sql = "SELECT LAST_INSERT_ID() AS 'id';"
                try:
                    cursor.execute(select_sql)
                    last_insert_id = cursor.fetchone().get("id")
                    print(
                        f"Retrieving initial last insert id: {last_insert_id}",
                        flush=True,
                    )
                    cursor.execute(
                        insert_sql,
                        (
                            policy.p_type,
                            policy.start_date,
                            policy.end_date,
                            policy.premium,
                            policy.state,
                            policy.active,
                            policy.user_id,
                        ),
                    )
                    cursor.execute(select_sql)
                    policy_id = cursor.fetchone().get("id")
                    print(f"Retrieved after last insert id: {policy_id}", flush=True)

                    if policy_id is None or policy_id is last_insert_id:
                        print("Insert ID didn't increment, rolling back", flush=True)
                        conn.rollback()
                    else:
                        conn.commit()

                except Exception as ex:
                    print(
                        f"There was a DB error when trying to insert a new policy. EX: {ex}",
                        flush=True,
                    )
                    return None
                return policy_id

    def update(self, policy: Policy) -> bool:
        """Updates the policy record in the database"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = """
                    UPDATE `ab_policy` SET
                        `start_date`=%s,
                        `end_date`=%s,
                        `premium`=%s,
                        `state`=%s,
                        `active`=%s,
                        `user_id`=%s
                    WHERE `policy_id`=%s;
                """
                print(
                    f"Policy values to update:\nstart_date: {policy.start_date}\nend_date: {policy.end_date}"
                    f"\npremium: {policy.premium}\nstate: {policy.state}\nuser_id: {policy.user_id}\n"
                    f"For Policy: {policy.policy_id}",
                    flush=True,
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            policy.start_date,
                            policy.end_date,
                            policy.premium,
                            policy.state,
                            policy.active,
                            policy.user_id,
                            policy.policy_id,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to update policy {policy}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

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
                    SELECT `start_date`, `end_date`, `premium`,
                    `p_type`, `state`, `active`, `policy_id`
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
                    results = cursor.fetchall()
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
        super(HPolicyManager, self).__init__()

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

    def create(self, policy: HomePolicy) -> Optional[int]:
        """Creates a new Home Policy record"""

        policy_id = super().create(policy)
        if policy_id is None:
            print(
                "There was an error trying to create the parent policy for a new Home Policy",
                flush=True,
            )
            return None
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "INSERT INTO `ab_home` (`policy_id`) VALUES (%s);"
                try:
                    cursor.execute(sql, (policy_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to insert policy_id {policy_id} in `ab_home`. EX: {ex}",
                        flush=True,
                    )
                    # delete policy since it failed to insert
                    super().delete(policy_id)
                    return None
                return int(policy_id)


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

    def create(self, policy: HomePolicy) -> Optional[int]:
        """Creates a new Home Policy record"""

        policy_id = super().create(policy)
        if policy_id is None:
            print(
                "There was an error trying to create the parent policy for a new Auto Policy",
                flush=True,
            )
            return None
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "INSERT INTO `ab_auto` (`policy_id`) VALUES (%s);"
                try:
                    cursor.execute(sql, (policy_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to insert policy_id {policy_id} in `ab_auto`. EX: {ex}",
                        flush=True,
                    )
                    # delete policy since it failed to insert
                    super().delete(policy_id)
                    return None
                return policy_id
