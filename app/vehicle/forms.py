from flask_wtf import FlaskForm
from wtforms import DateField, HiddenField, IntegerField, SelectField, StringField
from wtforms.validators import DataRequired, Length, NumberRange
from wtforms.widgets.html5 import DateInput

from app.policy.managers import APolicyManager
from app.vehicle.managers import DriverManager, VehicleManager


class VehicleForm(FlaskForm):

    vin = StringField(
        "Vehicle Identification Number (VIN)",
        validators=[DataRequired(), Length(min=13, max=17)],
    )
    make = StringField("Make", validators=[DataRequired(), Length(max=32)])
    model = StringField("Model", validators=[DataRequired(), Length(max=32)])
    year = IntegerField("Year", validators=[DataRequired(), NumberRange(max=9999)])
    state = SelectField(
        "State",
        validators=[DataRequired()],
        choices=[("", ""), ("L", "Leased"), ("F", "Financed"), ("O", "Owned")],
    )
    policy_id = IntegerField("Policy ID", validators=[DataRequired()])
    is_update = HiddenField(default=False)

    def set_udpate(self):
        self.is_update.data = True

    def validate(self):
        initial_validation = super().validate()
        if not initial_validation:
            return False

        vehicle = VehicleManager().get_by_id(self.vin.data)
        if not self.is_update.data and vehicle is not None:
            self.vin.errors.append(
                f"There is an existing vehicle with this vin: {self.vin.data}"
            )
            return False
        elif self.is_update.data and vehicle is None:
            self.vin.errors.append(
                f"Unable to locate vehicle with VIN {self.vin.data} to update."
            )
            return False

        policy = APolicyManager().get_by_id(self.policy_id.data)
        if policy is None:
            self.policy_id.errors.append(
                f"Unable to find a policy with ID {self.policy_id.data}"
            )
            return False
        return True


class DriverForm(FlaskForm):

    license = StringField("License #", validators=[DataRequired(), Length(max=16)])
    fname = StringField("First Name", validators=[DataRequired(), Length(max=32)])
    mname = StringField("Middle Initial", validators=[Length(max=1)])
    lname = StringField("Last Name", validators=[DataRequired(), Length(max=32)])
    birthdate = DateField("Birthdate", validators=[DataRequired()], widget=DateInput())
    is_update = HiddenField(default=False)

    def set_is_update(self):
        self.is_update.data = True

    def validate(self):
        initial_validation = super().validate()
        if not initial_validation:
            return False

        driver = DriverManager().get_by_id(self.license.data)

        if not self.is_update.data and driver is not None:
            self.license.errors.append(
                f"There already exists a driver with license: {self.license.data}"
            )
            return False
        elif self.is_update.data and driver is None:
            self.license.errors.append(
                f"Unable to located driver for {self.license.data} to update."
            )
            return False
        return True
