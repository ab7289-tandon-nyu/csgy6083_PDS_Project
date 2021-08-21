import logging
import sys

from flask import Flask, render_template

from app.extensions import csrf, login_manager, mysql, principal


def create_app(config_object="app.settings"):

    app = Flask(__name__.split(".")[0])
    app.config.from_object(config_object)

    configure_extensions(app)
    configure_bp(app)
    configure_logger(app)

    app.add_url_rule("/", endpoint="index")

    return app


def configure_extensions(app):

    mysql.init_app(app)
    csrf.init_app(app)
    login_manager.init_app(app)
    login_manager.session_protection = "strong"
    principal.init_app(app)

    return None


def configure_bp(app):

    from .public import views

    app.register_blueprint(views.bp)

    from app.policy import views

    app.register_blueprint(views.bp)

    from app.invoice import views

    app.register_blueprint(views.bp)

    from app.house import views

    app.register_blueprint(views.bp)

    from app.vehicle import views

    app.register_blueprint(views.bp)

    from app.mtom import views

    app.register_blueprint(views.bp)

    return None


def register_error_handlers(app):
    def render_error(error):
        """Renders the template corresponding to the error"""

        error_code = getattr(error, "code", 500)
        print(f"Running error handler! {error_code}", flush=True)
        # return render_template(f"{error_code}.html"), error_code
        return render_template(f"{error_code}.html")

    for error_code in [400, 401, 404, 500]:
        # for error_code in [BadRequest, Unauthorized, NotFound, HTTPException]:
        app.errorhandler(error_code)(render_error)
        # app.register_error_handler(error_code, render_error)

    return None


def configure_logger(app):
    """configure logger"""
    handler = logging.StreamHandler(sys.stdout)
    if not app.logger.handlers:
        app.logger.addHandler(handler)


if __name__ == "__main__":
    app = create_app()
    app.run()
