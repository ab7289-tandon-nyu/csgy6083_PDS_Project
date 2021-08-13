from flask import Blueprint, abort, render_template
from flask_login import login_required

from app.invoice.managers import Invoice, InvoiceManager

bp = Blueprint("invoice", __name__)


@bp.route("/invoice/<int:invoice_id>", methods=["GET"])
@login_required
def invoice(invoice_id: int):

    manager = InvoiceManager()
    invoice = manager.get_by_id(invoice_id)

    payments = None

    validate_perm(invoice)

    return render_template("invoice/invoice.html", invoice=invoice, payments=payments)


def validate_perm(invoice: Invoice):
    if not invoice:
        abort(404)
    # TODO create a function to get the user associated with the invoice from the policy
