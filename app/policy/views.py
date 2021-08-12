from flask import Blueprint, abort, render_template
from flask_login import current_user, login_required

from app.invoice.managers import InvoiceManager

# from app.invoice.models import Invoice
from app.policy.managers import PolicyManager

bp = Blueprint("policy", __name__)


@bp.route("/policy/<int:policy_id>")
@login_required
def policy(policy_id: int):
    manager = PolicyManager()
    policy = manager.get_by_id(policy_id)

    homes = None
    autos = None
    invoices = None

    if not policy:
        abort(404)
    elif policy.user_id is not current_user.user_id:
        abort(401)

    i_manager = InvoiceManager()
    invoices = i_manager.get_by_policy(policy_id)

    return render_template(
        "policy/policy.html", p=policy, invoices=invoices, homes=homes, autos=autos
    )
