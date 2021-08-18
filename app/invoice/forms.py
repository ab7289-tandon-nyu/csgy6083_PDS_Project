from flask_wtf import FlaskForm
from wtforms import DateField, DecimalField, HiddenField, SelectField
from wtforms.fields.core import IntegerField
from wtforms.validators import DataRequired, NumberRange
from wtforms.widgets.html5 import DateInput

from app.invoice.managers import InvoiceManager
from app.policy.managers import PolicyManager


class InvoiceForm(FlaskForm):

    invoice_date = DateField(
        "Invoice Date",
        id="invoice_date",
        validators=[DataRequired()],
        widget=DateInput(),
    )
    amount = DecimalField(
        "Invoice Amount",
        id="amount",
        validators=[DataRequired(), NumberRange(min=1, max=9999999.99)],
    )
    payment_date = DateField(
        "Payment Date",
        id="payment_date",
        validators=[DataRequired()],
        widget=DateInput(),
    )
    total_paid = DecimalField("Total Paid")
    active = SelectField("Active", choices=[("", ""), (1, "True"), (0, "False")])
    policy_id = IntegerField("Policy ID", validators=[DataRequired()])
    invoice_id = HiddenField(default=-1)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def validate(self):
        initial_validation = super().validate()
        if not initial_validation:
            return False

        policy = PolicyManager().get_by_id(self.policy_id.data)
        if policy is None:
            self.policy_id.errors.append(
                f"Unable to find a policy with ID {self.policy_id.data}"
            )
            return False
        return True


class PaymentForm(FlaskForm):

    pay_date = DateField("Pay Date", validators=[DataRequired()], widget=DateInput())
    amount = DecimalField(
        "Payment Amount",
        validators=[DataRequired(), NumberRange(min=1, max=9999999.99)],
    )
    pay_type = SelectField(
        "Payment Type",
        validators=[DataRequired()],
        choices=[
            ("", ""),
            ("PayPal", "PayPal"),
            ("Credit", "Credit"),
            ("Debit", "Debit"),
            ("Check", "Check"),
        ],
    )
    invoice_id = IntegerField("Invoice ID", validators=[DataRequired()])
    p_id = HiddenField(default=-1)

    def validate(self):
        initial_validation = super().validate()
        if not initial_validation:
            return False

        invoice = InvoiceManager().get_by_id(self.invoice_id.data)
        if not invoice:
            self.invoice_id.errors.append(
                f"Unable to find an invoice with ID {self.invoice_id.data}"
            )
            return False
        return True
