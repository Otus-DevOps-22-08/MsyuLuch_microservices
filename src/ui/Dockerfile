FROM ruby:2.2-alpine

ENV POST_SERVICE_HOST posts
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comments
ENV COMMENT_SERVICE_PORT 9292

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME
COPY . $APP_HOME

RUN apk --no-cache update && apk add --no-cache gcc libc-dev musl-dev build-base && \
    bundle install && \
    apk del gcc musl-dev libc-dev build-base && \
    rm -rf /var/lib/apt/lists/*

CMD ["puma"]
