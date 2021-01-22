# FROM nginx:1.17.10
# #デフォルトのnginxファイルを削除して作成したものコンテナないにコピー
# RUN rm -f /etc/nginx/conf.d/*

# ADD ./nginx/workdir.conf /etc/nginx/conf.d/workdir.conf


# #-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
# CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

FROM nginx:1.16
RUN apt-get update && \
  apt-get install -y apt-utils \
  locales && \
  echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
# 初期状態の設定ファイル
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf