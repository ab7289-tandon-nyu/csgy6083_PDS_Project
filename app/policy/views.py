from flask import Blueprint, abort, flash, redirect, render_template, request
from flask.helpers import url_for
from flask_login import current_user, login_required

from app.invoice.managers import InvoiceManager
from app.policy.forms import PolicyForm
from app.policy.managers import APolicyManager, HPolicyManager, PolicyManager

# from app.invoice.models import Invoice
from app.policy.models import AutoPolicy, HomePolicy, Policy
from app.utils import flash_errors

bp = Blueprint("policy", __name__)


@bp.route("/policy/<int:policy_id>", methods=["GET"])
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


@bp.route("/policy/form", methods=["GET", "POST"])
@login_required
def policy_form():
    """Route to create or update an insurance policy"""

    policy_id = request.args.get("policy_id", default=None, type=int)

    form = None
    if policy_id is not None:
        policy = PolicyManager().get_by_id(policy_id)
        form = PolicyForm(request.form, obj=policy)
    else:
        form = PolicyForm(request.form)
    # use the page dict to store properties that we want to display in the webpage
    page = {}
    if request.method == "POST" and form.validate_on_submit():
        manager = HPolicyManager() if form.p_type.data == "H" else APolicyManager()
        policy = None
        if form.p_type.data == "H":
            # create Home Policy object
            policy = HomePolicy(
                form.start_date.data,
                form.end_date.data,
                form.premium.data,
                state=form.state.data,
                active=form.active.data,
                user_id=form.user_id.data,
                policy_id=form.policy_id.data,
            )
        else:
            # create Auto Policy Object
            policy = AutoPolicy(
                form.start_date.data,
                form.end_date.data,
                form.premium.data,
                state=form.state.data,
                active=form.active.data,
                user_id=form.user_id.data,
                policy_id=form.policy_id.data,
            )

        if request.args.get("action") == "create":
            policy_id = manager.create(policy)
        else:
            manager.update(policy)
            policy_id = form.policy_id.data

        if policy_id is None:
            flash("Failure, please try again later")
            redirect(url_for("public.home"))
        flash("Success!")
        return redirect(url_for("policy.policy", policy_id=policy_id))
    else:
        if not form.validate_on_submit() and request.method != "GET":
            flash_errors(form)

        form_type = request.args.get("type", default="update", type=str)
        if not policy_id and form_type == "update":
            abort(400, "parameter `policy_id` is missing")
        form_class = request.args.get("class", type=str)
        if not form_class:
            abort(400, "parameter `class` is missing. Did you forget &class=<class>?")

        page["type"] = form_type
        page["class"] = form_class
        manager = PolicyManager()
        policy = manager.get_by_id(policy_id)

        if form_type == "update":
            validate_perm(policy)
            page["title"] = f"Update Policy {policy.policy_id}"
            page["form_action"] = url_for("policy.policy_form", action="update")
        elif form_type == "create":
            page["title"] = "Create a new Policy"
            page["form_action"] = url_for("policy.policy_form", action="create")

    return render_template("policy/policy_form.html", page=page, form=form)


@bp.route("/policy/<int:policy_id>/delete", methods=["GET"])
@login_required
def delete(policy_id: int):
    """Deletes the policy with the specified ID"""

    manager = PolicyManager()
    policy = manager.get_by_id(policy_id)

    validate_perm(policy)

    if policy.p_type == "H":
        manager = HPolicyManager()
    elif policy.p_type == "A":
        manager = APolicyManager()

    deleted = manager.delete(policy_id)
    if deleted:
        flash("success!", "info")
        return redirect(url_for("public.home"))
    else:
        flash("There was an error deleting the policy. Please try again later", "error")
        return redirect(url_for("policy.policy", policy_id=policy_id))


def validate_perm(policy: Policy):
    """Checks that the policy is valid and that the user is allowed to see it"""

    if not policy:
        abort(404)
    elif policy.user_id is not current_user.user_id:
        abort(401)
