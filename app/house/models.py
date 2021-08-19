class House:
    """DTO Class for home records"""

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
