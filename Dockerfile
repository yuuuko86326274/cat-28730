FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

// 「-qqオプション」はエラー以外何も吐かないことを意味する。
// 「-y」オプションは全部yesで実行することを意味する。

RUN mkdir /cat-28730
WORKDIR /cat-28730

COPY Gemfile /cat-28730/Gemfile
COPY Gemfile.lock /cat-28730/Gemfile.lock

RUN bundle install
COPY . /cat-28730