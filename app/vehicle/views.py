from flask import Blueprint, abort, flash, redirect, render_template, request, url_for
from flask_login import login_required

from app.utils import flash_errors
from app.vehicle.forms import VehicleForm
from app.vehicle.managers import VehicleManager
from app.vehicle.models import Vehicle

bp = Blueprint("vehicle", __name__)


@bp.route("/vehicle/<string:vin>", methods=["GET"])
@login_required
def vehicle(vin: str):

    vehicle = VehicleManager().get_by_id(vin)

    # TODO get drivers as well for display

    validate_vehicle_perm(vehicle)

    return render_template("vehicle/vehicle.html", vehicle=vehicle)


@bp.route("/vehicle/form", methods=["GET", "POST"])
@login_required
def vehicle_form():

    vin = request.args.get("vin", default=None, type=str)
    v_manager = VehicleManager()

    form = None
    if vin is not None:
        form = VehicleForm(request.form, obj=v_manager.get_by_id(vin))
    else:
        form = VehicleForm(request.form)
    page = {}
    if request.method == "POST" and form.validate_on_submit():
        vehicle = Vehicle(
            form.make.data,
            form.model.data,
            form.year.data,
            form.state.data,
            policy_id=form.policy_id.data,
            vin=form.vin.data,
        )

        if request.args.get("action") == "create":
            vin = v_manager.create(vehicle)
        else:
            v_manager.update(vehicle)
            vin = form.vin.data

        if vin is None:
            flash("Failure, please try again later", "warning")
            return redirect(url_for("public.home"))
        flash("Success!", "info")
        return redirect(url_for("vehicle.vehicle", vin=vin))
    else:
        form_type = request.args.get("type", default="update", type=str)
        if not vin and form_type == "update":
            abort(400, "parameter `vin` is missing")

        page["type"] = form_type
        vehicle = v_manager.get_by_id(vin)

        if form_type == "update":
            validate_vehicle_perm(vehicle)
            page["title"] = f"Update Vehicle {vehicle.vin}"
            page["form_action"] = url_for("vehicle.vehicle_form", action="update")
        elif form_type == "create":
            page["title"] = "Add a new Vehicle"
            page["form_action"] = url_for("vehicle.vehicle_form", action="create")

        if not form.validate_on_submit() and request.method != "GET":
            flash_errors(form)

        return render_template("vehicle/vehicle_form.html", page=page, form=form)


@bp.route("/vehicle/<string:vin>/delete", methods=["GET"])
@login_required
def delete_vehicle(vin: str):

    manager = VehicleManager()
    vehicle = manager.get_by_id(vin)

    validate_vehicle_perm(vehicle)

    deleted = manager.delete(vehicle.vin)
    if deleted:
        flash("Success!", "info")
        return redirect(url_for("policy.policy", policy_id=vehicle.policy_id))
    else:
        flash(
            "There was an error deleting the Vehicle. Please contact your admin",
            "error",
        )
        return redirect(url_for("vehicle.vehicle", vin=vin))


def validate_vehicle_perm(vehicle):
    if vehicle is None:
        abort(404, "Unable to find the specified vehicle")
