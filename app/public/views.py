from flask import Blueprint, redirect, render_template, url_for  # flash,; request,

from app.extensions import login_manager

# from app.public.forms import LoginForm
from app.user.models import UserManager  # , User

# from flask_login import login_required, login_user, logout_user

# from app.utils import flash_errors

bp = Blueprint("public", __name__, static_folder="../static")


@login_manager.user_loader
def load_user(user_id):
    """login_manager hook to load user by ID"""
    return UserManager().get_by_username(user_id)


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
    return render_template("public/index.html")
