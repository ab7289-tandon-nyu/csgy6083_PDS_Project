from flask_wtf import FlaskForm
from wtforms import PasswordField, SelectField, StringField
from wtforms.validators import DataRequired, Email, Length

from app.user.models import CustomerManager, UserManager


class LoginForm(FlaskForm):
    """Form to log into the site"""

    username = StringField(
        "Username",
        id="user_name",
        validators=[
            DataRequired(message="Username is required"),
            Length(min=4, max=32, message="Please enter between 4 and 32 characters"),
        ],
    )
    password = PasswordField(
        "Password",
        id="password",
        validators=[DataRequired(message="Password is required")],
    )

    def __init__(self, *args, **kwargs):
        """Create an instance of the login form"""
        super(LoginForm, self).__init__(*args, **kwargs)
        self.user = None

    def validate(self):
        """Validate the fields in the form"""
        initial_validation = super(LoginForm, self).validate()
        if not initial_validation:
            return False

        manager = UserManager()
        self.user = manager.get_by_username(self.username.data)
        print(f"self.user: {self.user}", flush=True)
        if not self.user:
            self.username.errors.append("Unknown username")
            return False

        if not self.user.check_password(self.password.data):
            self.password.errors.append("Invalid password")
            return False

        return True


class RegisterForm(FlaskForm):

    username = StringField(
        "Username",
        id="user_name",
        validators=[
            DataRequired(message="Username is required"),
            Length(min=4, max=32, message="Please enter between 4 and 32 characters"),
        ],
    )
    password = PasswordField(
        "Password",
        id="password",
        validators=[
            DataRequired(message="Password is required"),
            Length(min=4, max=128, message="Please enter betwen 4 and 32 characters"),
        ],
    )

    email = StringField(
        "Email",
        id="email",
        validators=[
            DataRequired(message="Email is required"),
            Email(message="Please enter a valid email address"),
        ],
    )

    def __init__(self, *args, **kwargs):
        super(RegisterForm, self).__init__(*args, **kwargs)
        self.user = None

    def validate(self):
        initial_validation = super(RegisterForm, self).validate()
        if not initial_validation:
            return False

        db = UserManager()
        if db.get_by_username(self.username.data) is not None:
            self.username.errors.append(
                f"Error: User {self.username.data} is already registered."
            )
            return False
        return True


class CustomerRegisterForm(FlaskForm):

    username = StringField(
        "Username",
        id="user_name",
        validators=[
            DataRequired(message="Username is required"),
            Length(min=4, max=32, message="Please enter between 4 and 32 characters"),
        ],
    )
    password = PasswordField(
        "Password",
        id="password",
        validators=[
            DataRequired(message="Password is required"),
            Length(min=4, max=128, message="Please enter betwen 4 and 32 characters"),
        ],
    )
    email = StringField(
        "Email",
        id="email",
        validators=[
            DataRequired(message="Email is required"),
            Email(message="Please enter a valid email address"),
        ],
    )
    fname = StringField(
        "First Name", id="fname", validators=[DataRequired(), Length(max=32)]
    )
    mname = StringField("Middle Initial", id="mname", validators=[Length(min=0, max=1)])
    lname = StringField(
        "Last Name", id="lname", validators=[DataRequired(), Length(max=32)]
    )
    gender = SelectField(
        "Gender", id="gender", choices=[("", ""), ("f", "Female"), ("m", "Male")]
    )
    marital_status = SelectField(
        "Marital Status",
        id="marital_status",
        choices=[("", ""), ("s", "Single"), ("m", "Married"), ("w", "Widowed")],
        validators=[DataRequired()],
    )
    street_1 = StringField(
        "Street address", id="street_1", validators=[DataRequired(), Length(max=32)]
    )
    street_2 = StringField(
        "Suite or Apartment", id="street_2", validators=[Length(max=32)]
    )
    city = StringField("City", id="city", validators=[DataRequired(), Length(max=32)])
    state = StringField("State", id="state", validators=[DataRequired(), Length(max=2)])
    zip = StringField(
        "Zipcode", id="zip", validators=[DataRequired(), Length(min=5, max=5)]
    )

    def validate(self):
        inital_validation = super(CustomerRegisterForm, self).validate()
        if not inital_validation:
            return False

        db = CustomerManager()
        if db.get_by_username(self.username.data) is not None:
            self.username.errors.append(
                f"Error: Customer {self.username.data} is already registered."
            )
            return False
        return True
