FROM python:3.7.9
RUN apt update && apt install -y procps dnsutils net-tools vim tree psutils curl tcpdump util-linux bsdmainutils less file
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY app.py entrypoint.sh ./
ENTRYPOINT ["/app/entrypoint.sh"]
