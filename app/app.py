from flask import Flask

from .extensions import mysql

# from app.extensions import TODO
# from app.models import TODO


def create_app(config_object="app.settings"):

    app = Flask(__name__.split(".")[0])
    app.config.from_object(config_object)

    configure_extensions(app)
    configure_bp(app)

    app.add_url_rule("/", endpoint="index")

    return app


def configure_extensions(app):

    mysql.init_app(app)

    return None


def configure_bp(app):

    from . import index

    app.register_blueprint(index.bp)

    return None


if __name__ == "__main__":
    app = create_app()
    app.run()
