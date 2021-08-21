from typing import Any

from flask import Blueprint, abort, redirect, render_template, request, url_for
from flask_login import login_required

from app.mtom.forms import RelAddForm, RelDeleteForm
from app.utils import flash_errors
from app.vehicle.managers import DriverManager, VDManager, VehicleManager

bp = Blueprint("rel", __name__)


@bp.route("/rel_form", methods=["GET", "POST"])
@login_required
def rel_form():

    # Get query parameters from the Request
    form_type = request.args.get("type", default="create", type=str)
    base = request.args.get("base", default=None)
    base_id = request.args.get("base_id", default=None)
    child = request.args.get("child", default=None)

    form = None
    if form_type == "create":
        form = RelAddForm(request.form)
    else:
        form = RelDeleteForm(request.form)

    # get the parent element and the possible child elements
    item = element_factory(base, base_id)
    if item is None:
        abort(404, f"Unable to find item for base {base} and base_id {base_id}")

    items = item_list_factory(base, base_id, child, form_type)
    form.set_base_val(item)
    form.set_choice_list(items)

    if request.method == "POST" and form.validate_on_submit():

        if form_type == "create":
            if base == "vehicle":
                return redirect(
                    url_for(
                        "vehicle.update_relation",
                        vin=base_id,
                        license=form.to_add.data,
                        action="create",
                        next=url_for("vehicle.vehicle", vin=base_id),
                    )
                )
            else:
                return redirect(
                    url_for(
                        "vehicle.update_relation",
                        license=base_id,
                        vin=form.to_add.data,
                        action="create",
                        next=url_for("vehicle.driver", license=base_id),
                    )
                )
        else:
            if base == "vehicle":
                return redirect(
                    url_for(
                        "vehicle.update_relation",
                        vin=base_id,
                        license=form.to_del.data,
                        action="delete",
                        next=url_for("vehicle.vehicle", vin=base_id),
                    )
                )
            else:
                return redirect(
                    url_for(
                        "vehicle.update_relation",
                        license=base_id,
                        vin=form.to_del.data,
                        action="delete",
                        next=url_for("vehicle.driver", license=base_id),
                    )
                )

    else:
        if not form.validate_on_submit() and request.method != "GET":
            flash_errors(form)

    if form_type == "create":
        form_action = url_for("rel.rel_form", **request.args)
        return render_template("mtom/add.html", form=form, action=form_action)
    else:
        form_action = url_for("rel.rel_form", **request.args)
        return render_template("mtom/delete.html", form=form)


def element_factory(base: str, base_id: Any):

    if base is None or base_id is None:
        raise TypeError(f"Base {base} and base_id {base_id} cannot be empty")

    if base == "vehicle":
        return VehicleManager().get_by_id(base_id)
    elif base == "driver":
        return DriverManager().get_by_id(base_id)

    raise TypeError(f"element_factory: unknown base type: {base}")


def item_list_factory(base, base_id, child, type):

    if base is None or base_id is None or child is None:
        raise TypeError(
            f"Base {base}, base_id {base_id}, and child {child} cannot be empty"
        )

    complement = type == "create"

    if base == "vehicle" and child == "driver":
        return VDManager().get_drivers_for_vehicle(base_id, complement=complement)
    elif base == "driver" and child == "vehicle":
        return VDManager().get_vehicles_for_driver(base_id, complement=complement)

    raise TypeError(f"Unrecognized base and child combo: {base}, {child}")
