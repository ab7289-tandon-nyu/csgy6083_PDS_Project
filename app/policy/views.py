from flask import Blueprint, abort, render_template
from flask_login import current_user, login_required

from app.policy.managers import PolicyManager

bp = Blueprint("policy", __name__)


@bp.route("/policy/<int:policy_id>")
@login_required
def policy(policy_id: int):
    manager = PolicyManager()
    policy = manager.get_by_id(policy_id)
    if not policy:
        abort(404)
    elif policy.user_id is not current_user.user_id:
        abort(401)
    return render_template("policy/policy.html", p=policy)
