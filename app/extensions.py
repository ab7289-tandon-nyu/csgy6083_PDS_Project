from typing import Dict

from flask_login.config import LOGIN_MESSAGE
from flask_login.login_manager import LoginManager  # noqa: F401
from flask_principal import Principal
from flask_wtf.csrf import CSRFProtect
from flaskext.mysql import MySQL
from pymysql.cursors import DictCursor

mysql = MySQL(cursorclass=DictCursor)
csrf = CSRFProtect()
login_manager = LoginManager()
principal = Principal()
