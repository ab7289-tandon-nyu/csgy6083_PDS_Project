from flask import Flask, render_template

from app.extensions import csrf, login_manager, mysql, principal


def create_app(config_object="app.settings"):

    app = Flask(__name__.split(".")[0])
    app.config.from_object(config_object)

    configure_extensions(app)
    configure_bp(app)

    app.add_url_rule("/", endpoint="index")

    return app


def configure_extensions(app):

    mysql.init_app(app)
    csrf.init_app(app)
    login_manager.session_protection = "strong"
    principal.init_app(app)

    return None


def configure_bp(app):

    from .public import views

    app.register_blueprint(views.bp)

    return None


def register_error_handlers(app):
    def render_error(error):
        """Renders the template corresponding to the error"""
        error_code = getattr(error, "code", 500)
        return render_template(f"{error_code}.html"), error_code

    for error_code in [401, 404, 500]:
        app.errorhandler(error_code)(render_error)

    return None


if __name__ == "__main__":
    app = create_app()
    app.run()
