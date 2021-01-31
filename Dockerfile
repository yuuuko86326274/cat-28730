FROM ruby:2.6.5

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /workdir
WORKDIR /workdir

COPY Gemfile /workdir/Gemfile
COPY Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install

ADD . /workdir

EXPOSE 3000