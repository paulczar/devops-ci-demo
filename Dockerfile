FROM python:2

ADD . /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD gunicorn -b 0.0.0.0:8080 app:app --reload
