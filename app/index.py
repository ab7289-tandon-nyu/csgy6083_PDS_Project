from flask import Blueprint, render_template

from .extensions import mysql

bp = Blueprint("index", __name__, url_prefix="/index")


@bp.route("/", methods=("GET",))
def index():
    print("hello!")
    conn = mysql.connect()
    cursor = conn.cursor()
    print("yay! got curosr")
    cursor.close()
    conn.close()
    return render_template("index.html")
