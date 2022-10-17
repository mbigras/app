import os

import flask

app = flask.Flask(os.environ.get("APP", __name__))
app.config["JSONIFY_PRETTYPRINT_REGULAR"] = True
app.config["ENV"] = os.environ.get("ENV", "prod")
app.config["VERSION"] = os.environ.get("VERSION", "unset")

@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def hello(path):
    return flask.jsonify(
        path=path,
        params=flask.request.args,
        app=app.name,
        env=app.config["ENV"],
        version=app.config["VERSION"],
        features=[
            "feature1",
        ],

    )
