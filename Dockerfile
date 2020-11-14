FROM ruby:2.6.5

ENV DOCKERIZE_VERSION v0.6.1

RUN apt-get update && apt-get install -y --no-install-recommends\
    nodejs \
    mariadb-client \
    build-essential  \
    wget \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /myproject
WORKDIR /myproject

COPY Gemfile /myproject/Gemfile
COPY Gemfile.lock /myproject/Gemfile.lock

# 注意！！ Gemfile.lockにかいてあるbundlerバージョンが2.0.1以降だとエラーが出ます！
ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler
RUN bundle install

COPY . /myproject