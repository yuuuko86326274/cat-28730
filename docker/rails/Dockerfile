FROM ruby:2.6.5

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client 

ENV RAILS_ROOT /home/ec2-user/workdir
RUN mkdir  -p $RAILS_ROOT/log
RUN mkdir -p $RAILS_ROOT/tmp/sockets
RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock $RAILS_ROOT/

RUN gem install bundler -v 2.1.4
RUN bundle install

COPY . $RAILS_ROOT

WORKDIR $RAILS_ROOT
EXPOSE 3000

CMD [ "config/containers/app_cmd.sh" ]