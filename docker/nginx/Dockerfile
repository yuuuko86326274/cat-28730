FROM nginx:1.16
RUN apt-get update && \
  apt-get install -y apt-utils \
  locales && \
  echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

ENV RAILS_ROOT home/ec2-user/workdir
WORKDIR $RAILS_ROOT
COPY public public/

# 初期状態の設定ファイル
ADD ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# FROM nginx:1.16

# RUN apt-get update && \
#   apt-get install -y apt-utils \
#   locales && \
#   echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
#   locale-gen ja_JP.UTF-8
# ENV LC_ALL ja_JP.UTF-8
 
# # establish where Nginx should look for files
# ENV RAILS_ROOT /var/www/workdir

# RUN mkdir -p $RAILS_ROOT/tmp/pids
# RUN mkdir -p $RAILS_ROOT/tmp/sockets
 
# # Set our working directory inside the image
# WORKDIR $RAILS_ROOT
# # create log directory
# RUN mkdir log
 
# # copy over static assets
# COPY public public/

# # copy our Nginx config template
# COPY ./docker/nginx/nginx.conf /tmp/workdir.nginx
 
# RUN rm -f /etc/nginx/conf.d/*

# # substitute variable references in the Nginx config template for real values from the environment
# # put the final config in its place
# RUN envsubst '$RAILS_ROOT' < /tmp/workdir.nginx > /etc/nginx/conf.d/default.conf
 
# # Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
# # CMD [ "nginx", "-g", "daemon off;" ]
# CMD ["/usr/sbin/nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]

# FROM nginx:stable

# RUN rm -f /etc/nginx/conf.d/*

# COPY ./docker/nginx/nginx.conf /etc/nginx/conf.d/myapp.conf

# CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf