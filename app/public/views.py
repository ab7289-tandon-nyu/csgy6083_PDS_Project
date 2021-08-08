from flask import Blueprint, flash, redirect, render_template, request, url_for, _request_ctx_stack
from flask_login import login_required, login_user, logout_user, current_user

from app.extensions import login_manager
from app.public.forms import LoginForm, RegisterForm
from app.user.models import User, UserManager
from app.utils import flash_errors

bp = Blueprint("public", __name__, static_folder="../static")


@login_manager.user_loader
def load_user(user_id):
    """login_manager hook to load user by ID"""
    return UserManager().get_by_id(user_id)


# @login_manager.unauthorized_handler
# def unauthorized_callback():
    """callback method required to redirect the user to the login page
    if they are unauthorized or if their session has become invalidated.
    without this the user just gets a 401 Unauthorized error, which isn't
    very helpful"""
    # return redirect(url_for("public.home"))


@bp.route("/", methods=["GET", "POST"])
def home():
    """public home page"""
    # print(f"context user: {_request_ctx_stack.top.user}")
    if not current_user:
        print("no current user detected", flush=True)
    else:
        print(f"current user detected: {current_user}", flush=True)
    return render_template("public/index.html", current_user=current_user)


@bp.route("/register", methods=["GET", "POST"])
def register():
    """route for the RegisterForm, allows new users to register"""
    form = RegisterForm(request.form)
    if form.validate_on_submit():
        new_user = User(
            form.username.data, form.email.data
        )
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


@bp.route("/login", methods=["GET", "POST"])
def login():
    """route to allow an existing user to log in"""
    form = LoginForm(request.form)
    if request.method == "POST":
        if form.validate_on_submit():
            login_user(form.user)
            # print(f"Session: {session}", flush=True)
            flash("Your are logged in.", "success")
            print(f"context user: {_request_ctx_stack.top.user}")
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
