FROM ruby:2.2-alpine

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME

RUN apk --no-cache update && apk add --no-cache gcc libc-dev musl-dev build-base && \
    gem install bundler:1.17.2 --no-document && \
    bundle install && \
    apk del gcc musl-dev libc-dev build-base && \
    rm -rf /var/lib/apt/lists/*

CMD ["puma"]
