FROM ruby:2.2-alpine

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME

RUN apk --no-cache --update add build-base && \
    bundle install && \
    apk del build-base && \
    rm -rf /var/lib/apt/lists/*

CMD ["puma"]
