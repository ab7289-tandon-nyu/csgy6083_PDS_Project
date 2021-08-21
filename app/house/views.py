from flask import Blueprint, abort, flash, render_template, request
from flask.helpers import url_for
from flask_login import login_required
from werkzeug.utils import redirect

from app.house.forms import HouseForm
from app.house.managers import HouseManager
from app.house.models import House
from app.utils import flash_errors

bp = Blueprint("house", __name__)


@bp.route("/house/<int:home_id>", methods=["GET"])
@login_required
def house(home_id: int):
    manager = HouseManager()
    house = manager.get_by_id(home_id)

    validate_perm(house)

    return render_template("house/house.html", house=house)


@bp.route("/house/form", methods=["GET", "POST"])
@login_required
def house_form():

    home_id = request.args.get("home_id", default=None, type=int)

    form = None
    if home_id is not None:
        form = HouseForm(request.form, obj=HouseManager().get_by_id(home_id))
    else:
        form = HouseForm(request.form)

    page = {}
    if request.method == "POST" and form.validate_on_submit():
        house = House(
            form.purchase_date.data,
            form.purchase_value.data,
            form.area.data,
            form.house_type.data,
            form.auto_fire_notif.data,
            form.home_security.data,
            form.pool.data,
            form.basement.data,
            home_id=form.home_id.data,
            policy_id=form.policy_id.data,
        )

        if request.args.get("action") == "create":
            home_id = HouseManager().create(house)
        else:
            HouseManager().update(house)
            home_id = form.home_id.data

        if home_id is None:
            flash("Failure, please try again later", "warning")
            return redirect(url_for("public.home"))
        return redirect(url_for("house.house", home_id=home_id))
    else:
        if not form.validate_on_submit() and request.method != "GET":
            flash_errors(form)

        form_type = request.args.get("type", default="create", type=str)
        if not home_id and form_type == "update":
            abort(400, "parameter `home_id` is missing")

        page["type"] = form_type
        house = HouseManager().get_by_id(home_id)

        if form_type == "update":
            page["title"] = f"Update Home {house.home_id}"
            page["form_action"] = url_for("house.house_form", action="update")
        else:
            page["title"] = "Create new Home"
            page["form_action"] = url_for("house.house_form", action="create")

        return render_template("house/house_form.html", page=page, form=form)


@bp.route("/house/<int:home_id>/delete", methods=["GET"])
@login_required
def delete(home_id: int):

    manager = HouseManager()
    house = manager.get_by_id(home_id)

    validate_perm(house)

    deleted = manager.delete(home_id)
    if deleted:
        flash("Success!", "info")
        return redirect(url_for("policy.policy", policy_id=house.policy_id))
    else:
        flash("There was an error deleting the house. Please check the logs", "error")
        return redirect(url_for("house.house", home_id=house.home_id))


def validate_perm(house: House):
    if house is None:
        abort(404)
