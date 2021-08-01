from flask import Flask

# from app.extensions import TODO
# from app.models import TODO


def create_app(config_object="app.settings"):

    app = Flask(__name__.split(".")[0])
    app.config.from_object(config_object)

    from . import index

    app.register_blueprint(index.bp)

    app.add_url_rule("/", endpoint="index")

    return app


if __name__ == "__main__":
    app = create_app()
    app.run()
