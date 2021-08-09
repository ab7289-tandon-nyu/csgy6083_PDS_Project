class Invoice:
    def __init__(
        self,
        invoice_date: str,
        invoice_amount: float,
        payment_date: str,
        total_paid: float,
        active: bool,
        invoice_id: int = -1,
        policy_id: int = -1,
    ):
        self.invoice_date = invoice_date
        self.invoice_amount = invoice_amount
        self.payment_date = payment_date
        self.total_paid = total_paid
        self.active = active
        self.invoice_id = invoice_id
        self.policy_id = policy_id
