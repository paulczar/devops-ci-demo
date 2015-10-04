FROM alpine:3.2

RUN apk add --update python && \
    apk add wget ca-certificates && \
    wget -q "https://bootstrap.pypa.io/get-pip.py" -O /dev/stdout | python && \
    apk del wget ca-certificates && \
    rm /var/cache/apk/*

ADD . /app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT gunicorn -b 0.0.0.0:5000 app:app
