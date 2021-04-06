FROM ruby:2.6.5

ENV RAILS_ROOT /workdir
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV RAILS_ENV production
ENV NODE_ENV production

COPY Gemfile Gemfile.lock $RAILS_ROOT/


RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    default-mysql-client \
    nodejs \
    npm \
    vim \
    sudo && \
    npm install -g -y yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
 && gem install bundler -v 2.1.4 \
 && bundle install \
 && bundle exec rails webpacker:install

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone

COPY . $RAILS_ROOT

RUN mkdir -p $RAILS_ROOT/tmp/sockets
RUN mkdir -p $RAILS_ROOT/tmp/pids

ARG RAILS_MASTER_KEY
ARG SECRET_KEY_BASE

RUN SECRET_KEY_BASE=${SECRET_KEY_BASE} bundle exec rails assets:precompile RAILS_ENV=production \
 && yarn cache clean \
 && rm -rf node_modules tmp/cache

ENV RAILS_SERVE_STATIC_FILES="true"
CMD ["bundle", "exec", "puma", "-e", "production", "-C", "config/puma.rb"]