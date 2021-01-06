FROM nginx:stable
#デフォルトのnginxファイルを削除して作成したものコンテナないにコピー
RUN rm -f /etc/nginx/conf.d/*

COPY ./nginx/nginx.conf /etc/nginx/conf.d/myapp.conf

#-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf