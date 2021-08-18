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
                    results = cursor.fetchall()
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

    def create(self, payment: Payment) -> Optional[int]:
        """creates a new payment record"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                p_id = None
                insert_sql = (
                    "INSERT INTO `ab_payment` "
                    "(`pay_date`, `amount`, `pay_type`, `invoice_id`) "
                    "VALUES "
                    "(%s, %s, %s, %s);"
                )
                select_sql = "SELECT LAST_INSERT_ID() AS 'id';"
                try:
                    cursor.execute(
                        insert_sql,
                        (
                            payment.pay_date,
                            payment.amount,
                            payment.pay_type,
                            payment.invoice_id,
                        ),
                    )
                    cursor.execute(select_sql)
                    p_id = cursor.fetchone().get("id")

                    if p_id is None or p_id == 0:
                        print(
                            "Insert ID didn't increment for Payment. Rolling back.",
                            flush=True,
                        )
                        conn.rollback()
                    else:
                        conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when inserting a new Payment. EX: {ex}",
                        flush=True,
                    )
                    return None
                return p_id

    def update(self, payment: Payment) -> bool:
        """Updates the payment with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "UPDATE `ab_payment` SET "
                    "`pay_date`=%s, "
                    "`amount`=%s, "
                    "`pay_type`=%s, "
                    "`invoice_id`=%s "
                    "WHERE `p_id`=%s;"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            payment.pay_date,
                            payment.amount,
                            payment.pay_type,
                            payment.invoice_id,
                            payment.p_id,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB Error when updating Payment {payment.p_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def delete(self, p_id: int) -> bool:
        """Deletes the payment record with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_payment` WHERE `p_id`=%s"
                try:
                    cursor.execute(sql, (p_id,))
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when deleting payment {p_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True


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
                    results = cursor.fetchall()
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

    def create(self, invoice: Invoice) -> Optional[int]:
        """creates a new invoice and returns its PK"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                invoice_id = None
                insert_sql = (
                    "INSERT INTO `ab_invoice` "
                    "(`invoice_date`, `amount`, `payment_date`, `total_paid`, `active`, `policy_id`) "
                    "VALUES "
                    "(%s, %s, %s, %s, %s, %s);"
                )
                select_sql = "SELECT LAST_INSERT_ID() AS 'id';"
                try:
                    cursor.execute(
                        insert_sql,
                        (
                            invoice.invoice_date,
                            invoice.amount,
                            invoice.payment_date,
                            invoice.total_paid,
                            invoice.active,
                            invoice.policy_id,
                        ),
                    )
                    cursor.execute(select_sql)
                    invoice_id = cursor.fetchone().get("id")

                    if invoice_id is None or invoice_id == 0:
                        print(
                            "Insert ID didn't increment for Invoice, rolling back",
                            flush=True,
                        )
                        conn.rollback()
                    else:
                        conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB Error when trying to insert a new invoice. EX: {ex}",
                        flush=True,
                    )
                    return None
                return invoice_id

    def update(self, invoice: Invoice) -> bool:
        """Updates the Invoice Record in the database"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = (
                    "UPDATE `ab_invoice` SET "
                    "`invoice_date`=%s, "
                    "`amount`=%s, "
                    "`payment_date`=%s, "
                    "`total_paid`=%s, "
                    "`active`=%s "
                    "WHERE `invoice_id`=%s;"
                )
                try:
                    cursor.execute(
                        sql,
                        (
                            invoice.invoice_date,
                            invoice.amount,
                            invoice.payment_date,
                            invoice.total_paid,
                            invoice.active,
                            invoice.invoice_id,
                        ),
                    )
                    conn.commit()
                except Exception as ex:
                    print(
                        f"There was a DB error when trying to update invoice {invoice.invoice_id}. EX: {ex}",
                        flush=True,
                    )
                    return False
                return True

    def delete(self, invoice_id: int) -> bool:
        """deletes an invoice with the specified ID"""

        with self.get_connection() as conn:
            with conn.cursor() as cursor:
                sql = "DELETE FROM `ab_invoice` WHERE `invoice_id`=%s;"
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
