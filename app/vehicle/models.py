from app.db import DTOBase


class Vehicle(DTOBase):

    __id_field__ = "vin"
    __display__ = "display_name"

    def __init__(
        self,
        make: str,
        model: str,
        year: int,
        state: str,
        policy_id: int = -1,
        vin: str = None,
    ):
        self.make = make
        self.model = model
        self.year = year
        self.state = state
        self.policy_id = policy_id
        self.vin = vin

    @property
    def display_name(self):
        return f"{self.vin} - {self.make} {self.model}"


class Driver(DTOBase):

    __id_field__ = "license"
    __display__ = "full_name"

    def __init__(
        self, fname: str, mname: str, lname: str, birthdate: str, license: str = None
    ):
        self.fname = fname
        self.mname = mname
        self.lname = lname
        self.birthdate = birthdate
        self.license = license

    @property
    def full_name(self):
        return f"{self.fname} {self.lname}"


class VehicleDriver:
    def __init__(self, license: str = None, vin: str = None):
        self.license = license
        self.vin = vin
