from flask import Blueprint, abort, flash, redirect, render_template, request, url_for
from flask_login import login_required

from app.utils import flash_errors
from app.vehicle.forms import DriverForm, VehicleForm
from app.vehicle.managers import DriverManager, VDManager, VehicleManager
from app.vehicle.models import Driver, Vehicle

bp = Blueprint("vehicle", __name__)


@bp.route("/vehicle/<string:vin>", methods=["GET"])
@login_required
def vehicle(vin: str):

    vehicle = VehicleManager().get_by_id(vin)

    drivers = None

    validate_vehicle_perm(vehicle)

    drivers = VDManager().get_drivers_for_vehicle(vin)

    return render_template("vehicle/vehicle.html", vehicle=vehicle, drivers=drivers)


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
            form.set_udpate()
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


def validate_driver_perm(driver):
    if driver is None:
        abort(404, "Unable to locate the specified driver")


@bp.route("/driver/<string:license>", methods=["GET"])
@login_required
def driver(license: str):

    driver = DriverManager().get_by_id(license)

    vehicles = None

    validate_driver_perm(driver)

    vehicles = VDManager().get_vehicles_for_driver(license)

    return render_template("vehicle/driver.html", driver=driver, vehicles=vehicles)


@bp.route("/driver/form", methods=["GET", "POST"])
@login_required
def driver_form():

    license = request.args.get("license", default=None, type=str)
    d_manager = DriverManager()

    form = None
    if license is not None:
        form = DriverForm(request.form, obj=d_manager.get_by_id(license))
    else:
        form = DriverForm(request.form)

    page = {}
    print(f"form is valid: {form.validate_on_submit()}", flush=True)
    if request.method == "POST" and form.validate_on_submit():
        driver = Driver(
            form.fname.data,
            form.mname.data,
            form.lname.data,
            form.birthdate.data,
            license=form.license.data,
        )

        if request.args.get("action") == "create":
            license = d_manager.create(driver)
        else:
            d_manager.update(driver)
            license = form.license.data

        if license is None:
            flash("Failure, please try again later", "warning")
            return redirect(url_for("public.home"))
        flash("Success!", "info")
        return redirect(url_for("vehicle.driver", license=license))
    else:
        form_type = request.args.get("type", default="create", type=str)
        if not license and form_type == "update":
            abort(400, "parameter `license` is missing")

        page["type"] = form_type
        driver = d_manager.get_by_id(license)

        if form_type == "update":
            validate_driver_perm(driver)
            page["title"] = f"Update Driver {driver.license}"
            page["form_action"] = url_for("vehicle.driver_form", action="update")
            form.set_is_update()
        elif form_type == "create":
            page["title"] = "Add a new Driver"
            page["form_action"] = url_for("vehicle.driver_form", action="create")

        if not form.validate_on_submit() and request.method != "GET":
            flash_errors(form)

        return render_template("vehicle/driver_form.html", page=page, form=form)


@bp.route("/driver/<string:license>/delete", methods=["GET"])
@login_required
def delete_driver(license: str):

    manager = DriverManager()
    driver = manager.get_by_id(license)

    validate_driver_perm(driver)

    deleted = manager.delete(driver.license)
    if deleted:
        flash("Success!", "info")
        return redirect(url_for("public.home"))
    else:
        flash(
            "There was an error deleting the driver. Please contact your admin",
            "error",
        )
        return redirect(url_for("vehicle.driver", license=license))
