from flask_wtf.form import FlaskForm
from wtforms.fields.core import DateField, DecimalField, IntegerField, SelectField
from wtforms.fields.simple import HiddenField
from wtforms.validators import DataRequired, NumberRange
from wtforms.widgets.html5 import DateInput

from app.policy.managers import HPolicyManager


class HouseForm(FlaskForm):

    purchase_date = DateField(
        "Purchase Date", validators=[DataRequired()], widget=DateInput()
    )
    purchase_value = DecimalField(
        "Purchase Value",
        validators=[DataRequired(), NumberRange(min=1, max=999999999.99)],
    )
    area = DecimalField(
        "Area (in square feet)", validators=[DataRequired(), NumberRange(min=1)]
    )
    house_type = SelectField(
        "House Type",
        validators=[DataRequired()],
        choices=[
            ("", ""),
            ("S", "Single Family"),
            ("M", "Multi-family"),
            ("C", "Condominium"),
            ("T", "Town House"),
        ],
    )
    auto_fire_notif = SelectField(
        "Automatic Fire Notification System",
        validators=[DataRequired()],
        choices=[("", ""), (1, "Yes"), (0, "No")],
    )
    home_security = SelectField(
        "Home Security System",
        validators=[DataRequired()],
        choices=[("", ""), (1, "Yes"), (0, "No")],
    )
    pool = SelectField(
        "Pool",
        choices=[
            ("", ""),
            ("U", "Underground"),
            ("O", "Overground"),
            ("I", "Indoor"),
            ("M", "Multiple"),
        ],
    )
    basement = SelectField(
        "Basement",
        validators=[DataRequired()],
        choices=[("", ""), (1, "Yes"), (0, "No")],
    )
    policy_id = IntegerField("Policy ID", validators=[DataRequired()])
    home_id = HiddenField(default=-1)

    def validate(self):
        initial_validation = super().validate()
        if not initial_validation:
            return False

        if not HPolicyManager().get_by_id(self.policy_id.data):
            self.policy_id.errors.append(
                f"Unable to locate a policy for ID: {self.policy_id.data}"
            )
            return False
        return True
