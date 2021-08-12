from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import current_user, login_required, login_user, logout_user

from app.extensions import login_manager
from app.policy.managers import PolicyManager

# from app.policy.models import Policy
from app.public.forms import CustomerRegisterForm, LoginForm, RegisterForm
from app.user.managers import CustomerManager, UserManager
from app.user.models import Customer, User
from app.utils import flash_errors

bp = Blueprint("public", __name__, static_folder="../static")


@login_manager.user_loader
def load_user(user_id):
    """login_manager hook to load user by ID"""
    return UserManager().get_by_id(user_id)


@login_manager.unauthorized_handler
def unauthorized_callback():
    """callback method required to redirect the user to the login page
    if they are unauthorized or if their session has become invalidated.
    without this the user just gets a 401 Unauthorized error, which isn't
    very helpful"""
    return redirect(url_for("public.home"))


@bp.route("/", methods=["GET", "POST"])
def home():
    """public home page"""
    # TODO fill in details about customer based on type
    # such ash showing links to car / home policies
    policies = None
    if current_user and current_user.user_id:
        p_manager = PolicyManager()
        policies = p_manager.get_policies_for_user(current_user.user_id)

    return render_template("public/index.html", policies=policies)


@bp.route("/register", methods=["GET", "POST"])
def register():
    """route for the RegisterForm, allows new users to register"""
    form = RegisterForm(request.form)
    if form.validate_on_submit():
        new_user = User(form.username.data, form.email.data)
        new_user.set_password(form.password.data)
        result = UserManager().create_user(new_user)
        if result:
            flash("Thank you for registering, you may now log in", "success")
            return redirect(url_for("public.login"))
        else:
            flash("There was an error persisting the user")
    else:
        flash_errors(form)
    return render_template("public/register.html", form=form)


@bp.route("/customer_register", methods=["GET", "POST"])
def customer_register():
    form = CustomerRegisterForm(request.form)
    if form.validate_on_submit():
        customer = Customer(
            form.username.data,
            form.email.data,
            form.fname.data,
            form.mname.data,
            form.lname.data,
            form.gender.data,
            form.marital_status.data,
            form.street_1.data,
            form.street_2.data,
            form.city.data,
            form.state.data,
            form.zip.data,
            password=form.password.data,
        )
        result = CustomerManager().create_customer(customer)
        if result:
            flash("Thank you for registering, you may now log in", "success")
            return redirect(url_for("public.login"))
        else:
            flash("There was an error persisting the user.")
    else:
        flash_errors(form)
    return render_template("public/customer_register.html", form=form)


@bp.route("/login", methods=["GET", "POST"])
def login():
    """route to allow an existing user to log in"""
    form = LoginForm(request.form)
    if request.method == "POST":
        if form.validate_on_submit():
            login_user(form.user)
            # print(f"Session: {session}", flush=True)
            flash("Your are logged in.", "success")
            redirect_url = request.args.get("next") or url_for("public.home")
            return redirect(redirect_url)
        else:
            flash_errors(form)
    return render_template("public/login.html", form=form)


@bp.route("/logout")
@login_required
def logout():
    """logs the current user out"""
    logout_user()

    # for key in ("identity.id", "identity.auth_type"):
    # session.pop(key, None)

    # identity_changed.send(
    # current_app._get_current_object(), identity=AnonymousIdentity()
    # )
    return redirect(url_for("public.login"))
