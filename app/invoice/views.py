from flask import Blueprint, abort, flash, redirect, render_template, request, url_for
from flask_login import login_required

from app.invoice.forms import InvoiceForm
from app.invoice.managers import Invoice, InvoiceManager, Payment, PaymentManager
from app.utils import flash_errors

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


@bp.route("/invoice/form", methods=["GET", "POST"])
@login_required
def invoice_form():
    """Route to create or update an invoice"""

    invoice_id = request.args.get("invoice_id", default=None, type=int)

    form = None
    if invoice_id is not None:
        invoice = InvoiceManager().get_by_id(invoice_id)
        form = InvoiceForm(request.form, obj=invoice)
    else:
        form = InvoiceForm(request.form)

    # use the page dict to store properties for the page
    page = {}
    if request.method == "POST" and form.validate_on_submit():
        manager = InvoiceManager()
        invoice = Invoice(
            form.invoice_date.data,
            form.amount.data,
            form.payment_date.data,
            form.total_paid.data,
            form.active.data,
            invoice_id=form.invoice_id.data,
            policy_id=form.policy_id.data,
        )

        if request.args.get("action") == "create":
            invoice_id = manager.create(invoice)
        else:
            manager.update(invoice)
            invoice_id = form.invoice_id.data

        if invoice_id is None:
            flash("Failure, please try again later", "warning")
            return redirect(url_for("public.home"))
        flash("Success!", "info")
        return redirect(url_for("invoice.invoice", invoice_id=invoice_id))

    else:
        if not form.validate_on_submit() and request.method != "GET":
            flash_errors(form)

        form_type = request.args.get("type", default="update", type=str)
        if not invoice_id and form_type == "update":
            abort(400, "parameter `invoice_id` is missing")

        page["type"] = form_type
        invoice = InvoiceManager().get_by_id(invoice_id)

        if form_type == "update":
            validate_invoice_perm(invoice)
            page["title"] = f"Update Invoice {invoice.invoice_id}"
            page["form_action"] = url_for("invoice.invoice_form", action="update")
        elif form_type == "create":
            page["title"] = "Create a new Invoice"
            page["form_action"] = url_for("invoice.invoice_form", action="create")

        return render_template("invoice/invoice_form.html", page=page, form=form)


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
