FROM python:3.6.0-alpine

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

WORKDIR /app
COPY . /app

RUN apk --no-cache update && apk add --no-cache gcc libc-dev musl-dev build-base && \
    pip install -U pip && \
    pip install -r /app/requirements.txt && \
    apk del gcc musl-dev libc-dev build-base

ENTRYPOINT ["python3", "post_app.py"]
