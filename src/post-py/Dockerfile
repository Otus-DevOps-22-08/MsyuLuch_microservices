FROM python:3.6.0-alpine

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

WORKDIR /app
COPY . /app

RUN apk --no-cache --update add build-base && \
    pip install -U pip && \
    pip install -r /app/requirements.txt && \
    apk del build-base

ENTRYPOINT ["python3", "post_app.py"]
