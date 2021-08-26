from app.db import DTOBase


class House(DTOBase):
    """DTO Class for home records"""

    __id_field__ = "home_id"
    __display__ = "display_name"

    def __init__(
        self,
        purchase_date: str,
        purchase_value: float,
        area: float,
        house_type: str,
        auto_fire_notif: bool,
        home_security: bool,
        pool: str,
        basement: bool,
        home_id: int = -1,
        policy_id: int = -1,
    ):
        self.purchase_date = purchase_date
        self.purchase_value = purchase_value
        self.area = area
        self.house_type = house_type
        self.auto_fire_notif = auto_fire_notif
        self.home_security = home_security
        self.pool = pool
        self.basement = basement
        self.home_id = home_id
        self.policy_id = policy_id

    @property
    def display_name(self):
        return f"{self.get_type()} {self.home_id}"

    def get_type(self):
        if self.house_type == "S":
            return "Single Family"
        elif self.house_type == "M":
            return "Multi-family"
        elif self.house_type == "C":
            return "Condominium"
        else:
            return "Town House"
