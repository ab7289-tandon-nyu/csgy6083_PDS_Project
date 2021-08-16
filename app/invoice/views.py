from flask import Blueprint, abort, render_template
from flask_login import login_required

from app.invoice.managers import Invoice, InvoiceManager, Payment, PaymentManager

bp = Blueprint("invoice", __name__)


@bp.route("/invoice/<int:invoice_id>", methods=["GET"])
@login_required
def invoice(invoice_id: int):

    manager = InvoiceManager()
    invoice = manager.get_by_id(invoice_id)

    payments = None

    validate_invoice_perm(invoice)

    pay_manager = PaymentManager()
    payments = pay_manager.get_by_invoice(invoice_id)

    return render_template("invoice/invoice.html", invoice=invoice, payments=payments)


@bp.route("/invoice/<int:invoice_id>/payment/<int:p_id>", methods=["GET"])
@login_required
def payment_for_invoice(invoice_id: int, p_id: int):

    i_manager = InvoiceManager()
    p_manager = PaymentManager()

    invoice = i_manager.get_by_id(invoice_id)
    payment = p_manager.get_by_id(p_id)

    validate_invoice_perm(invoice)
    validate_payment_perm(payment)

    return render_template("invoice/payment.html", invoice=invoice, payment=payment)


@bp.route("/payment/<int:p_id>", methods=["GET"])
@login_required
def payment(p_id: int):

    manager = PaymentManager()
    payment = manager.get_by_id(p_id)

    validate_payment_perm(payment)

    return render_template("invoice/payment.html", payment=payment)


def validate_invoice_perm(invoice: Invoice):
    if not invoice:
        abort(404)
    # TODO create a function to get the user associated with the invoice from the policy


def validate_payment_perm(payment: Payment):
    if not payment:
        abort(404)
    # TODO create a function to check if user is allowed to see payment
