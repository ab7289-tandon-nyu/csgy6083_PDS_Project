from typing import List, Optional

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
                sql = "DELETE FROM `ab_vehicle` WHERE `vin`=%s;"
                try:
                    cursor.execute(sql, (vin,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to delete vehicle {vin}. EX: {ex}",
                        flush=True,
                    )
                    return False
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

    def get_vehicles_for_driver(self, license: str) -> Optional[List[Vehicle]]:
        """Retrieves the list of Vehicles associated with a driver license"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "SELECT `vin` WHERE `license`=%s;"
                results = None
                try:
                    cursor.execute(sql, (license,))
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was an error when retrieving vehicles for license: {license}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(f"No vehicles found for license: {license}", flush=True)
                    return None
                return self.v_manager.get_by_ids(
                    list(map(lambda x: x.get("vin"), results))
                )

    def get_drivers_for_vehicle(self, vin: str) -> Optional[List[Driver]]:
        """Retrieves the list of drivers associated with a Vehicle's VIN"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "SELECT `license` WHERE `vin`=%s"
                results = None
                try:
                    cursor.execute(sql, (vin,))
                    results = cursor.fetchall()
                except Exception as ex:
                    print(
                        f"There was a DB error when retrieving drivers for VIN: {vin}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(f"No drivers foudn for vin: {vin}", flush=True)
                    return None
                return self.d_manager.get_by_ids(
                    list(map(lambda x: x.get("license"), results))
                )
