FROM ruby:2.6.5

ENV RAILS_ROOT="/workdir"
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV RAILS_ENV="production"
ENV NODE_ENV="production"

COPY Gemfile Gemfile.lock $RAILS_ROOT/

ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install nodejs

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN gem install bundler -v 2.1.4
RUN bundle install

RUN mkdir -p $RAILS_ROOT/tmp/sockets
VOLUME $RAILS_ROOT/public
VOLUME $RAILS_ROOT/tmp

COPY . $RAILS_ROOT

RUN yarn install --check-files
RUN $SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile \
 && yarn cache clean \
 && rm -rf node_modules tmp/cache

CMD [ "config/containers/app_cmd.sh" ]
EXPOSE 3000