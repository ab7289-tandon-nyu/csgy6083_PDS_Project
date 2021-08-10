from typing import List, Optional


class Payment:
    def __init__(
        self,
        pay_date: str,
        amount: float,
        pay_type: str,
        p_id: int = -1,
        invoice_id: int = -1,
    ):
        self.p_id = p_id
        self.pay_date = pay_date
        self.amount = amount
        self.pay_type = pay_type
        self.invoice_id = invoice_id


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
        payments: Optional[List[Payment]] = None,
    ):
        self.invoice_date = invoice_date
        self.invoice_amount = invoice_amount
        self.payment_date = payment_date
        self.total_paid = total_paid
        self.active = active
        self.invoice_id = invoice_id
        self.policy_id = policy_id
        if payments:
            self.payments = payments
        else:
            self.payments = []
