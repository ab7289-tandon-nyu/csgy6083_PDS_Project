from flask import Blueprint, render_template

bp = Blueprint("index", __name__, url_prefix="/index")


@bp.route("/", methods=("GET",))
def index():
    print("hello!")
    return render_template("index.html")
