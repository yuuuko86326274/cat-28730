#!/usr/bin/env bash
 
# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
bundle exec unicorn -p 3000 -c config/unicorn.rb -D -E $RAILS_ENV;