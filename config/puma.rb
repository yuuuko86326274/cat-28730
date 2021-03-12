# アプリケーションディレクトリ
app_dir = File.expand_path("../..", __FILE__) #"/workdir"
# ソケット通信を図る為bindでURI指定
bind "unix://#{app_dir}/tmp/sockets/puma.sock"
# PIDファイル所在(プロセスID)
pidfile "#{app_dir}/tmp/pids/puma.pid"
# stateファイルはpumactlコマンドでサーバーを操作する。その所在。
state_path "#{app_dir}/tmp/pids/puma.state"
# 標準出力/標準エラーを出力するファイルの所在。
stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
#port       ENV.fetch("PORT") { 3000 }
# environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart