import os

import flask

app = flask.Flask(os.environ.get("APP", __name__))
app.config["JSONIFY_PRETTYPRINT_REGULAR"] = True
app.config["JSON_SORT_KEYS"] = False
app.config["ENV"] = os.environ.get("ENV", "prod")
app.config["TAG"] = os.environ.get("TAG", "unset")

@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def hello(path):
    return flask.jsonify(
        app=app.name,
        env=app.config["ENV"],
        tag=app.config["TAG"],
        features=[
            "feature1",
        ],
        path=path,
        params=flask.request.args,

    )
