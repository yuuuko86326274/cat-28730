FROM ruby:2.6.5-alpine

# apk --update --no-cache add でインストールするパッケージを指定します。。
RUN apk --update --no-cache add tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev linux-headers nodejs && \
    mkdir /workdir

# Docker内部でworkdirをどこに置くか、どういう名前にするかを決める記述
WORKDIR /workdir

# Docker内部でGemfile、Gemfile.lockをどこに配置するかを決める記述
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

# 注意！！ Gemfile.lockにかいてあるbundlerバージョンが2.0.1以降だとエラー!
ENV BUNDLER_VERSION 2.1.4
# && \で改行していくことにより、より軽量になる
RUN gem install bundler && \
    bundle install && \
# Warningがでたのでここでupdateを一度入れる
    apk update && \
# 上で指定したパッケージの中、開発環境を構築したら不要になるファイルたちをapk delで消す
    apk del libxml2-dev curl-dev make gcc libc-dev g++ linux-headers

ADD . /workdir
# 容量が大きく不要であるcacheファイルは構築後削除。
RUN rm -rf /usr/local/bundle/cache/* /workdir/vendor/bundle/cache/*