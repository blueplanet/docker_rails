FROM ruby:2.4.0

RUN \
  apt-get update && \
  curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
  apt-get install -y nodejs

WORKDIR /app

ARG BUNDLE_JOBS=4
RUN gem update --system && gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --path vendor/bundle

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
