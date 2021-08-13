from typing import List, Optional

from app.db import DBManager
from app.invoice.models import Invoice, Payment


class PaymentManager(DBManager):
    def __init__(self):
        super(PaymentManager, self).__init__()

    def get_by_id(self, p_id: int) -> Optional[Payment]:
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `pay_date`, `amount`, `pay_type`, `p_id`, `invoice_id`"
                    "FROM `ab_payment`"
                    "WHERE `p_id`=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (p_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was a DB Error when retrieving payments of id {p_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No payments found for id: {p_id}", flush=True)
                    return None
                return Payment(**result)

    def get_by_invoice(self, invoice_id: int) -> Optional[List[Payment]]:
        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `pay_date`, `amount`, `pay_type`, `p_id`, `invoice_id`"
                    "FROM `ab_payment`"
                    "WHERE `invoice_id`=%s"
                )
                results = None
                try:
                    cursor.execute(sql, (invoice_id,))
                    results = cursor.fetchmany()
                except Exception as ex:
                    print(
                        f"There was a DB Error when fetching payments for invoice id {invoice_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(f"No payments found for invoice_id: {invoice_id}", flush=True)
                    return None
                return [Payment(**result) for result in results]


class InvoiceManager(DBManager):
    def __init__(self):
        super(InvoiceManager, self).__init__()

    def get_by_id(self, invoice_id: int) -> Optional[Invoice]:
        """Retrieves an Invoice record with the specified ID, or None"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `invoice_date`, `amount`, `payment_date`, `total_paid`,"
                    " `active`, `invoice_id`, `policy_id`"
                    "FROM `ab_invoice`"
                    "WHERE  `invoice_id`=%s"
                )
                result = None
                try:
                    cursor.execute(sql, (invoice_id,))
                    result = cursor.fetchone()
                except Exception as ex:
                    print(
                        f"There was a DB Error when trying to retrieve invocies for id: {invoice_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not result:
                    print(f"No Invoices found for id: {invoice_id}", flush=True)
                    return None
                return Invoice(**result)

    def get_by_policy(self, policy_id: int) -> Optional[List[Invoice]]:
        """Retrieves a the list of invoices associated with a particular insurance policy, or None"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "SELECT `invoice_date`, `amount`, `payment_date`, `total_paid`,"
                    " `active`, `invoice_id`, `policy_id`"
                    "FROM `ab_invoice`"
                    "WHERE  `policy_id`=%s"
                )
                results = None
                try:
                    cursor.execute(sql, (policy_id,))
                    results = cursor.fetchmany()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to retrieve invoices for policy id {policy_id}. EX: {ex}",
                        flush=True,
                    )
                    return None
                if not results:
                    print(
                        f"No invoices were found associated with policy {policy_id}",
                        flush=True,
                    )
                    return None
                return [Invoice(**result) for result in results]

    def delete(self, invoice_id: int) -> bool:
        """deletes an invoice with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_invoice` WHERE `invoice_id`=%s"
                try:
                    cursor.execute(sql, (invoice_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to delete invoice with id= {invoice_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True
