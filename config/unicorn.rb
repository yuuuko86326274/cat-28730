# # Where our application lives. $RAILS_ROOT is defined in our Dockerfile.
# app_path = "/workdir"
 
# # Set the server's working directory
# working_directory app_path
 
# # Define where Unicorn should write its PID file
# pid "#{app_path}/tmp/pids/unicorn.pid"
 
# # Bind Unicorn to the container's default route, at port 3000
# listen "0.0.0.0:3000"
 
# # Define where Unicorn should write its log files
# stderr_path "#{app_path}/log/unicorn.stderr.log"
# stdout_path "#{app_path}/log/unicorn.stdout.log"
 
# # Define the number of workers Unicorn should spin up.
# # A new Rails app just needs one. You would scale this 
# # higher in the future once your app starts getting traffic.
# # See https://unicorn.bogomips.org/TUNING.html
# worker_processes 1
 
# # Make sure we use the correct Gemfile on restarts
# before_exec do |server|
#   ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
# end
 
# # Speeds up your workers.
# # See https://unicorn.bogomips.org/TUNING.html
# preload_app true
 
# #
# # Below we define how our workers should be spun up. 
# # See https://unicorn.bogomips.org/Unicorn/Configurator.html
# #
 
# before_fork do |server, worker|
#   # the following is highly recomended for Rails + "preload_app true"
#   # as there's no need for the master process to hold a connection
#   if defined?(ActiveRecord::Base)
#     ActiveRecord::Base.connection.disconnect!
#   end
 
#   # Before forking, kill the master process that belongs to the .oldbin PID.
#   # This enables 0 downtime deploys.
#   old_pid = "#{server.config[:pid]}.oldbin"
#   if File.exists?(old_pid) && server.pid != old_pid
#     begin
#       Process.kill("QUIT", File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH
#       # someone else did our job for us
#     end
#   end
# end
 
# after_fork do |server, worker|
#   if defined?(ActiveRecord::Base)
#     ActiveRecord::Base.establish_connection
#   end
# end


# Railsのルートパスを求める。(RAILS_ROOT/config/unicorn.rbに配置している場合。)
rails_root = ENV['RAILS_ROOT'] #File.expand_path('../../', __FILE__)
# RAILS_ENVを求める。（RAILS_ENV毎に挙動を変更したい場合に使用。今回は使用しません。)
# rails_env = ENV['RAILS_ENV'] || "development"

# 追記に記載してます。入れた方がいいです。
# ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{rails_root}/Gemfile"
end

# Unicornは複数のワーカーで起動するのでワーカー数を定義
# サーバーのメモリなどによって変更すること。
worker_processes 2

# # 指定しなくても良い。
# # Unicornの起動コマンドを実行するディレクトリを指定します。
# # （記載しておけば他のディレクトリでこのファイルを叩けなくなる。）
# working_directory rails_root

# 接続タイムアウト時間
timeout 30

# Unicornのエラーログと通常ログの位置を指定。
stderr_path  "#{rails_root}/log/unicorn_stderr.log" #File.expand_path('../../log/unicorn_stderr.log', __FILE__)
stdout_path  "#{rails_root}/log/unicorn_stdout.log" #File.expand_path('../../log/unicorn_stdout.log', __FILE__)

# # Nginxで使用する場合は以下の設定を行う。
listen "/var/tmp/unicorn.sock"  #"#{rails_root}/tmp/sockets/unicorn.sock" #File.expand_path('../../tmp/sockets/unicorn.sock', __FILE__)
# # とりあえず起動して動作確認をしたい場合は以下の設定を行う。
# # listen 80
# # ※「backlog」や「tcp_nopush」の設定もあるけど、よくわかって無い。

# プロセスの停止などに必要なPIDファイルの保存先を指定。
pid "/var/run/unicorn.pid"  #"#{rails_root}/tmp/pids/unicorn.pid"#File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)

# 基本的には`true`を指定する。Unicornの再起動時にダウンタイムなしで再起動が行われる。
preload_app true
# 効果なしとの記事を見たので、コメントアウト。
# GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

# USR2シグナルを受けると古いプロセスを止める。
# 後述するが、記述しておくとNginxと連携する時に良いことがある。
#切替必要
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

# $worker  = 2
#   $timeout = 30
#   $app_dir = "/workdir" #自分のアプリケーションまでのpath
#   $listen  = File.expand_path 'tmp/sockets/unicorn.sock', $app_dir
#   $pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
#   $std_log = File.expand_path 'log/.unicorn.log', $app_dir
#   # set config
#   worker_processes  $worker
#   working_directory $app_dir
#   stderr_path $std_log
#   stdout_path $std_log
#   timeout $timeout
#   listen  $listen
#   pid $pid
#   # loading booster
#   preload_app true
#   # before starting processes
#   before_fork do |server, worker|
#     defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
#     old_pid = "#{server.config[:pid]}.oldbin"
#     if old_pid != server.pid
#       begin
#         Process.kill "QUIT", File.read(old_pid).to_i
#       rescue Errno::ENOENT, Errno::ESRCH
#       end
#     end
#   end
#   # after finishing processes
#   after_fork do |server, worker|
#     defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
#   end

# worker_processes 1

# pid "/var/run/unicorn.pid"
# listen "/var/tmp/unicorn.sock"

# stdout_path "./log/unicorn.stdout.log"
# stderr_path "./log/unicorn.stderr.log"