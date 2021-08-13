from flask import Blueprint, abort, render_template, request
from flask_login import current_user, login_required

from app.invoice.managers import InvoiceManager
from app.policy.managers import PolicyManager

# from app.invoice.models import Invoice
from app.policy.models import Policy

bp = Blueprint("policy", __name__)


@bp.route("/policy/<int:policy_id>")
@login_required
def policy(policy_id: int):
    manager = PolicyManager()
    policy = manager.get_by_id(policy_id)

    homes = None
    autos = None
    invoices = None

    validate_perm(policy)

    i_manager = InvoiceManager()
    invoices = i_manager.get_by_policy(policy_id)

    return render_template(
        "policy/policy.html", p=policy, invoices=invoices, homes=homes, autos=autos
    )


@bp.route("/policy/<int:policy_id>/form")
@login_required
def policy_form(policy_id: int):
    form_type = request.args.get("type", default="update", type=str)
    page = {}
    page["type"] = form_type
    manager = PolicyManager()
    policy = manager.get_by_id(policy_id)

    validate_perm(policy)

    if form_type == "update":
        page["title"] = f"Update Policy {policy.policy_id}"
    elif form_type == "create":
        page["title"] = "Create a new Policy"

    return render_template("policy/policy_form.html", page=page)


def validate_perm(policy: Policy):
    """Checks that the policy is valid and that the user is allowed to see it"""

    if not policy:
        abort(404)
    elif policy.user_id is not current_user.user_id:
        abort(401)
