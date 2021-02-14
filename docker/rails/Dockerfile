FROM ruby:2.6.5

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client 

RUN mkdir /workdir
WORKDIR /workdir

COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler -v 2.1.4
RUN bundle install

COPY . workdir

EXPOSE 3000