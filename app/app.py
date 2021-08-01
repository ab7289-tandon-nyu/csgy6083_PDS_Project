from flask import Flask

# from app.extensions import TODO
# from app.models import TODO


def create_app(config_object="app.settings"):

    app = Flask(__name__.split(".")[0])
    app.config.from_object(config_object)

    return app
