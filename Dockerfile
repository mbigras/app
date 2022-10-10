FROM python:3.8.7
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY app.py entrypoint.sh ./

ARG APP=app
ARG ENV=prod
ARG VERSION=unset

ENV APP=$APP
ENV ENV=$ENV
ENV VERSION=$VERSION

ENTRYPOINT ["/app/entrypoint.sh"]
