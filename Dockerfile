FROM ruby:2.6.5

RUN apt-get update && apt-get install -y --no-install-recommends\
    nodejs \
    mariadb-client \
    build-essential  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /myproject

COPY Gemfile /myproject/Gemfile
COPY Gemfile.lock /myproject/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /myproject