import logging
import socket
import os

import flask
from prometheus_flask_exporter import PrometheusMetrics

app = flask.Flask(__name__)
metrics = PrometheusMetrics(app)

if os.environ.get("MAKE_UNHEALTHY"):
    app.config["MAKE_UNHEALTHY"] = True


@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def hello(path):
    message = f"host: {socket.gethostname()} full_path: {flask.request.full_path}"
    app.logger.info(message)
    if app.config.get("MAKE_UNHEALTHY"):
        app.logger.info(
            "Simulating an unhealthy application because MAKE_UNHEALTHY is set"
        )
        return f"app is unhealthy\n", 500
    else:
        return f"{message}\n"


if __name__ != "__main__":
    gunicorn_logger = logging.getLogger("gunicorn.error")
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000, debug=True)
