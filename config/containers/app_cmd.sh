#!/usr/bin/env bash
 
# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
exec bundle exec unicorn -c config/unicorn.rb -E $RAILS_ENV -D;