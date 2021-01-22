FROM nginx:1.17.10
#デフォルトのnginxファイルを削除して作成したものコンテナないにコピー
RUN rm -f /etc/nginx/conf.d/*

ADD ./nginx/workdir.conf /etc/nginx/conf.d/workdir.conf

#-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf