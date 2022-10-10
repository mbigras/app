FROM python:3.8.7
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY app.py entrypoint.sh ./
ENTRYPOINT ["/app/entrypoint.sh"]
