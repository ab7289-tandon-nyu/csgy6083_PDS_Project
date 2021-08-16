from flask_wtf import FlaskForm
from wtforms import DateField, DecimalField, HiddenField, SelectField, StringField
from wtforms.validators import DataRequired, Length, NumberRange
from wtforms.widgets.html5 import DateInput

from app.user.managers import UserManager


class PolicyForm(FlaskForm):

    p_type = SelectField(
        "Type",
        id="p_type",
        validators=[DataRequired()],
        choices=[("", ""), ("A", "Auto"), ("H", "Home")],
    )
    start_date = DateField(
        "Start Date", id="start_date", validators=[DataRequired()], widget=DateInput()
    )
    end_date = DateField(
        "End Date", id="end_date", validators=[DataRequired()], widget=DateInput()
    )
    premium = DecimalField(
        "Premium",
        id="premium",
        validators=[
            DataRequired(),
            NumberRange(min=1, message="Premium cannot be negative"),
        ],
    )
    state = SelectField(
        "Status", id="state", choices=[("", ""), ("C", "Current"), ("P", "Expired")]
    )
    active = SelectField(
        "Acitve", id="active", choices=[("", ""), (1, "True"), (0, "False")]
    )
    user_name = StringField(
        "Customer", id="user_name", validators=[DataRequired(), Length(max=32)]
    )
    user_id = HiddenField()

    def __init__(self, *args, **kwargs):
        super(PolicyForm, self).__init__(*args, **kwargs)
        self.policy = None

    def validate(self) -> bool:
        initial_validation = super(PolicyForm, self).validate()
        if not initial_validation:
            return False

        # check that the start date is not after the end date
        if self.start_date.data > self.end_date.data:
            self.start_date.errors.append("The Start Date cannot be after the End Date")
            self.end_date.errors.append("The End Date cannot be before the Start Date")
            return False

        user_manager = UserManager()
        user = user_manager.get_by_username(self.user_name.data)
        if user is None:
            self.user_name.errors.append(
                f"Unable to locate a customer with user_name: {self.user_name.data}"
            )
            return False
        else:
            self.user_id.data = user.user_id
        return True
