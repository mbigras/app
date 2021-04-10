import logging
import socket

import flask

app = flask.Flask(__name__)


@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def hello(path):
    message = f"host: {socket.gethostname()} full_path: {flask.request.full_path}"
    app.logger.info(message)
    return f"{message}\n"


if __name__ != "__main__":
    gunicorn_logger = logging.getLogger("gunicorn.error")
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000, debug=True)
