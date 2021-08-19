from flask_wtf import FlaskForm
from wtforms.fields.core import IntegerField, SelectField, StringField
from wtforms.validators import DataRequired, Length, NumberRange

from app.policy.managers import APolicyManager


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

    def validate(self):
        initial_validation = super().validate()
        if not initial_validation:
            return False

        policy = APolicyManager().get_by_id(self.policy_id.data)
        if policy is None:
            self.policy_id.errors.append(
                f"Unable to find a policy with ID {self.policy_id.data}"
            )
            return False
        return True
