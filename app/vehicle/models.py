class Vehicle:
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


class Driver:
    def __init__(
        self, fname: str, mname: str, lname: str, birthdate: str, license: str = None
    ):
        self.fname = fname
        self.mname = mname
        self.lname = lname
        self.birthdate = birthdate
        self.license = license


class VehicleDriver:
    def __init__(self, license: str = None, vin: str = None):
        self.license = license
        self.vin = vin
