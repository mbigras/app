import os
import socket

import flask

app = flask.Flask(os.environ.get("APP", __name__))
app.config["JSONIFY_PRETTYPRINT_REGULAR"] = True
app.config["JSON_SORT_KEYS"] = False
app.config["APP"] = os.environ.get("APP", app.name)
app.config["TAG"] = os.environ.get("TAG", "unset")
app.config["ENV"] = os.environ.get("ENV", "prod")
app.config["OWNER"] = os.environ.get("OWNER", "unset")
app.config["TEAM"] = os.environ.get("TEAM", "unset")
app.config["ORG"] = os.environ.get("ORG", "unset")
app.config["FEATURES"] = os.environ.get("FEATURES", "unset")
app.config["SPEED"] = os.environ.get("SPEED", "unset")
app.config["RELIABILITY"] = os.environ.get("RELIABILITY", "unset")

@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def hello(path):
    return flask.jsonify(
        app=app.config["APP"],
        tag=app.config["TAG"],
        env=app.config["ENV"],
        owner=app.config["OWNER"],
        team=app.config["TEAM"],
        org=app.config["ORG"],
        features=app.config["FEATURES"],
        speed=app.config["SPEED"],
        reliability=app.config["RELIABILITY"],
        host=socket.gethostname(),
        path=path,
        params=flask.request.args,
    )
