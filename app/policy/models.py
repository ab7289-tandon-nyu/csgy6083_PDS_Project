class Policy:
    """DTO Class for Insurance Policy records"""

    def __init__(
        self,
        start_date: str,
        end_date: str,
        premium: float,
        state: str = "C",
        active: bool = True,
        policy_id: int = -1,
        user_id: int = -1,
    ):
        self.start_date = start_date
        self.end_date = end_date
        self.premium = premium
        self.state = state
        self.active = active
        self.policy_id = policy_id
        self.user_id = user_id


class AutoPolicy(Policy):
    """DTO class for Auto Insurance Policy records"""

    def __init__(self, *args, **kwargs):
        super(AutoPolicy, self).__init__(*args, **kwargs)
        self.p_type = "A"

    def __repr__(self):
        return f"<AutoPolicy({self.policy_id})>"


class HomePolicy(Policy):
    """DTO class for Home Insurance Policy records"""

    def __init__(self, *args, **kwargs):
        super(HomePolicy, self).__init__(*args, **kwargs)
        self.p_type = "H"

    def __repr__(self):
        return f"<HomePolicy({self.policy_id})>"
