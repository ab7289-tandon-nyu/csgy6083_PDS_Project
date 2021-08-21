from typing import List, Optional

from jinjasql import JinjaSql

from app.db import DBManager
from app.vehicle.models import Driver, Vehicle


class VehicleManager(DBManager):
    def get_by_id(self, vin: str) -> Optional[Vehicle]:

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `make`, `model`, "
                    "`year`, `state`, `policy_id`, `vin` "
                    "FROM `ab_vehicle` "
                    "WHERE `vin`=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (vin,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to retrieve Vehicle {vin}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No vehicle found for id: {vin}", flush=True)
                    return None
                return Vehicle(**result)

    def get_by_ids(self, vins: List[str]) -> Optional[List[Vehicle]]:
        """Returns a list of Vehicles matching the supplied VINs"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                # see https://stackoverflow.com/questions/589284/imploding-a-list-for-use-in-a-python-mysqldb-in-clause
                placeholders = ",".join(["%s"] * len(vins))
                sql = (
                    "SELECT `make`, `model`, "
                    "`year`, `state`, `policy_id`, `vin` "
                    "FROM `ab_vehicle` "
                    f"WHERE `vin` IN ({placeholders})"
                )
                results = None
                try:
                    cursor.execute(sql, tuple(vins))
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB Error when retrieving vehicles: {vins}.\nEX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(
                        f"No Vehicles found for following list of VINs: {vins}",
                        flush=True,
                    )
                    return None
                return [Vehicle(**result) for result in results]

    def get_by_policy(self, policy_id: int) -> Optional[List[Vehicle]]:
        """Retrieves a list of Vehicles associated with the specified policy"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `make`, `model`, "
                    "`year`, `state`, `policy_id`, `vin` "
                    "FROM `ab_vehicle` "
                    "WHERE `policy_id`=%s"
                )
                results = None
                try:
                    cursor.execute(sql, (policy_id,))
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB error when retrieving Vehicles for policy: {policy_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(
                        f"No Vehicles found associated with policy: {policy_id}",
                        flush=True,
                    )
                    return None
                return [Vehicle(**result) for result in results]

    def create(self, vehicle: Vehicle) -> Optional[str]:
        """Creates a new Vehicle record and returns its PK"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "INSERT INTO `ab_vehicle` "
                    "(`make`, `model`, `year`, `state`, `policy_id`, `vin`) "
                    "VALUES "
                    "(%s, %s, %s, %s, %s, %s);"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            vehicle.make,
                            vehicle.model,
                            vehicle.year,
                            vehicle.state,
                            vehicle.policy_id,
                            vehicle.vin,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to insert a new vehicle. EX: {ex}",
                        flush=True,
                    )
                    return None
                return vehicle.vin

    def update(self, vehicle: Vehicle) -> bool:
        """Updates the vehicle record in the DB"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "UPDATE `ab_vehicle` SET "
                    "`make`=%s, "
                    "`model`=%s, "
                    "`year`=%s, "
                    "`state`=%s "
                    "WHERE `vin`=%s;"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            vehicle.make,
                            vehicle.model,
                            vehicle.year,
                            vehicle.state,
                            vehicle.vin,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when updating vehicle {vehicle.vin}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def delete(self, vin: str) -> bool:
        """deletes the vehicle with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_vehicle` WHERE `vin`=%s"
                try:
                    print(f"Deleting vin: {vin}", flush=True)
                    cursor.execute(sql, (vin,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to delete vehicle {vin}. EX: {ex}",
                        flush=True,
                    )
                    return False
                print("deleted succeeded", flush=True)
                return True


class DriverManager(DBManager):
    def get_by_id(self, license: str) -> Optional[Driver]:

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `fname`, `mname`, "
                    "`lname`, `birthdate`, `license` "
                    "FROM `ab_driver` "
                    "WHERE `license`=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (license,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to retrieve driver {license}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No driver found for id: {license}", flush=True)
                    return None
                return Driver(**result)

    def get_by_ids(self, licenses: List[str]) -> Optional[List[Driver]]:
        """Returns a list of Drivers matching the supplied licenses"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                # see https://stackoverflow.com/questions/589284/imploding-a-list-for-use-in-a-python-mysqldb-in-clause
                placeholders = ",".join(["%s"] * len(licenses))
                sql = (
                    "SELECT `fname`, `mname`, "
                    "`lname`, `birthdate`, `license` "
                    "FROM `ab_driver` "
                    f"WHERE `license` IN ({placeholders})"
                )
                results = None
                try:
                    cursor.execute(sql, tuple(licenses))
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB Error when retrieving drivers: {licenses}.\nEX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(
                        f"No drivers found for following list of licenses: {licenses}",
                        flush=True,
                    )
                    return None
                return [Driver(**result) for result in results]

    def create(self, driver: Driver) -> Optional[str]:
        """Creates a new Driver record and returns its PK"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "INSERT INTO `ab_driver` "
                    "(`fname`, `mname`, `lname`, `birthdate`, `license`) "
                    "VALUES "
                    "(%s, %s, %s, %s, %s);"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            driver.fname,
                            driver.mname,
                            driver.lname,
                            driver.birthdate,
                            driver.license,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to insert a new driver. EX: {ex}",
                        flush=True,
                    )
                    return None
                return driver.license

    def update(self, driver: Driver) -> bool:
        """Updates the driver record in the DB"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "UPDATE `ab_driver` SET "
                    "`fname`=%s, "
                    "`mname`=%s, "
                    "`lname`=%s, "
                    "`birthdate`=%s "
                    "WHERE `license`=%s;"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            driver.fname,
                            driver.mname,
                            driver.lname,
                            driver.birthdate,
                            driver.license,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when updating driver {driver.license}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def delete(self, license: str) -> bool:
        """deletes the driver with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_driver` WHERE `license`=%s;"
                try:
                    cursor.execute(sql, (license,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to delete driver {license}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True


class VDManager(DBManager):
    def __init__(self):
        super().__init__()
        self.v_manager = VehicleManager()
        self.d_manager = DriverManager()

    def get_vehicles_for_driver(
        self, license: str, complement: bool = False
    ) -> Optional[List[Vehicle]]:

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql_template = """
                    SELECT
                       `v`.`make`, `v`.`model`, `v`.`year`, `v`.`state`, `v`.`policy_id`, `v`.`vin`
                     FROM `ab_vehicle` v
                     JOIN `ab_driver_vehicle` dv ON `v`.`vin` = `dv`.`vin`
                     JOIN `ab_driver` d ON `dv`.`license` = `d`.`license`
                    {% if complement %}
                     WHERE `d`.`license` != {{ license }}
                    {% else %}
                     WHERE `d`.`license` = {{ license }}
                    {% endif %}
                """
                query, bind_params = JinjaSql().prepare_query(
                    sql_template, {"complement": complement, "license": license}
                )
                results = None
                try:
                    cursor.execute(query, bind_params)
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB error when retrieving vehicles for driver {license}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if results is None:
                    print(
                        f"Didn't find any vehicles associated with license {license}",
                        flush=True,
                    )
                return [Vehicle(**result) for result in results]

    def get_drivers_for_vehicle(
        self, vin: str, complement: bool = False
    ) -> Optional[List[Driver]]:

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql_template = """
                    SELECT
                       `d`.`fname`, `d`.`mname`, `d`.`lname`, `d`.`birthdate`, `d`.`license`
                     FROM `ab_driver` d
                     JOIN `ab_driver_vehicle` dv ON `d`.`license` = `dv`.`license`
                     JOIN `ab_vehicle` v ON `dv`.`vin` = `v`.`vin`
                    {% if complement %}
                     WHERE `v`.`vin` != {{ vin }}
                    {% else %}
                     WHERE `v`.`vin` = {{ vin }}
                    {% endif %}
                """
                query, bind_params = JinjaSql().prepare_query(
                    sql_template, {"complement": complement, "vin": vin}
                )
                results = None
                try:
                    cursor.execute(query, bind_params)
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB error when retrieving drivers for vehicle {vin}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if results is None:
                    print(
                        f"Did not return any drivers associated with vehicle {vin}",
                        flush=True,
                    )
                    return None
                return [Driver(**result) for result in results]

    def add_relation(self, vin: str, license: str) -> bool:
        """creates a new relation between the specified driver and vehicle"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "INSERT INTO `ab_driver_vehicle` (`vin`, `license`) "
                    "VALUES (%s, %s)"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            vin,
                            license,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        "There was a DB Error when creating a relation between "
                        f"vin {vin} and license {license}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def delete_relation(self, vin: str, license: str) -> bool:
        """Removes a relation between the specified driver and vehicle"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_driver_vehicle` WHERE `vin`=%s AND `license`=%s"
                try:
                    cursor.execute(
                        sql,
                        (
                            vin,
                            license,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        "There was a DB error when trying to remove relation between "
                        f"vin {vin} and license {license}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True
