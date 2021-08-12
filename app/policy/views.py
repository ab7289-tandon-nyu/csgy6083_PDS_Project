from flask import Blueprint, render_template
from flask_login import login_required

bp = Blueprint("policy", __name__)


@bp.route("/policy/<int:policy_id>")
@login_required
def policy(policy_id: int):
    # TODO load policy given the id
    return render_template("policy/policy.html")
