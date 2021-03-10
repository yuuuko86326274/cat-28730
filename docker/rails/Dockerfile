FROM ruby:2.6.5

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    default-mysql-client \
    nodejs \
    npm \
    vim \
    sudo && \
    npm install -g -y yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ROOT /workdir
RUN mkdir $RAILS_ROOT
# RUN chmod +x $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV RAILS_ENV="production"
ENV NODE_ENV="production"

COPY Gemfile Gemfile.lock $RAILS_ROOT/

RUN gem install bundler -v 2.1.4
RUN bundle install && \
    bundle exec rails webpacker:install
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone

COPY . $RAILS_ROOT

RUN mkdir -p $RAILS_ROOT/tmp/sockets
# RUN mkdir -p $RAILS_ROOT/tmp/pids
# VOLUME $RAILS_ROOT/public
# VOLUME $RAILS_ROOT/tmp
# VOLUME /var/lib/mysql

ARG RAILS_MASTER_KEY
# ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
ARG SECRET_KEY_BASE
# ENV SECRET_KEY_BASE ${SECRET_KEY_BASE}

RUN yarn install --check-files
RUN RAILS_ENV="production" \
 SECRET_KEY_BASE=${SECRET_KEY_BASE} \
 bundle exec rails assets:precompile \
 && yarn cache clean \
 && rm -rf node_modules tmp/cache

CMD ["bundle", "exec", "puma", "-E", "production", "-C", "config/puma.rb"]
# CMD [ "config/containers/app_cmd.sh" ]